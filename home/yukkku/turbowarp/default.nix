{ pkgs, ... }:
let
  microbitZip = pkgs.fetchurl {
    url = "https://packagerdata.turbowarp.org/scratch-microbit-1.2.0.hex.zip";
    hash = "sha256-39V0twkwf+dsRNu2sKyJQueQj01cGDWfriX72jyfQ5k=";
  };
  turbowarp = pkgs.buildNpmPackage (finalAttrs: {
    pname = "turbowarp-desktop";
    version = "1.15.5";
    src = pkgs.fetchFromGitHub {
      owner = "TurboWarp";
      repo = "desktop";
      tag = "v${finalAttrs.version}";
      hash = "sha256-hbWhmezS8Juz3St7EwfGm8HMPgJXCAt2dyxHw/nuzzI=";
    };
    npmDepsHash = "sha256-iFg51IYp8TPhOhGikDQ0fsksM/k37+I+Xzo5Bxtpk48=";
    npmDepsFetcherVersion = 2;
    forceGitDeps = true;
    makeCacheWritable = true;
    npmBuildScript = "webpack:prod";

    ELECTRON_SKIP_BINARY_DOWNLOAD = "1";
    preBuild = ''
      export HOME=$(mktemp -d)
      export ELECTRON_CACHE=$HOME/.cache/electron
      mkdir -p $ELECTRON_CACHE
      ln -s ${pkgs.electron}/bin/electron $ELECTRON_CACHE/electron

      pushd node_modules/scratch-gui
      export NODE_PATH=$(pwd)/node_modules:$(pwd)/../../node_modules
      cp ${./prepublish.mjs} ./scripts/nix-prepublish.mjs 
      node ./scripts/nix-prepublish.mjs ${microbitZip}
      popd
    '';

    postBuild = ''
      ./node_modules/.bin/electron-builder --linux dir --config.electronDist=${pkgs.electron}/libexec/electron
    '';

    installPhase = ''
      runHook preInstall

      mkdir -p $out/opt/turbowarp $out/bin
      cp -r dist/linux-unpacked/* $out/opt/turbowarp/

      makeWrapper ${pkgs.electron}/bin/electron $out/bin/turbowarp-desktop \
        --add-flags $out/opt/turbowarp/resources/app.asar \
        --set ELECTRON_FORCE_IS_PACKAGED 1

      runHook postInstall
    '';

    nativeBuildInputs = [ pkgs.makeWrapper ];
  });
in
{
  home.packages = [ turbowarp ];
}
