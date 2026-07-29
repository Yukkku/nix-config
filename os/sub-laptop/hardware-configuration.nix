{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  boot.initrd.supportedFilesystems.btrfs = true;
  boot.initrd.systemd.services.impermanence = {
    description = "Rollback Btrfs root subvolume to empty";
    wantedBy = [ "initrd.target" ];
    requires = [ "initrd-root-device.target" ];
    after = [ "initrd-root-device.target" ];
    before = [ "sysroot.mount" ];
    path = with pkgs; [
      btrfs-progs
      coreutils
      util-linux
    ];
    script = ''
      mkdir -p /mnt_io
      mount -o subvol=/ /dev/disk/by-uuid/68bcdacd-e0c3-4cd1-b306-4fc2e1d3499a /mnt_io
      if [ -e /mnt_io/@ ]; then
        btrfs subvolume delete -R /mnt_io/@
      fi
      btrfs subvolume create /mnt_io/@
      umount /mnt_io
    '';
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/68bcdacd-e0c3-4cd1-b306-4fc2e1d3499a";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D178-9670";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/68bcdacd-e0c3-4cd1-b306-4fc2e1d3499a";
    fsType = "btrfs";
    options = [ "subvol=@nix" ];
  };

  fileSystems."/persist" = {
    device = "/dev/disk/by-uuid/68bcdacd-e0c3-4cd1-b306-4fc2e1d3499a";
    fsType = "btrfs";
    options = [ "subvol=@persist" ];
    neededForBoot = true;
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
