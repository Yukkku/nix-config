{ writeText, ... }: {
  matches = [ "https://oeis.org/*" ];
  css = writeText "custom.css" ''
    :where(:root) {
      color-scheme: dark;
    }
    :where(input) {
      background: rgba(0 0 0 / 0.3);
      border: 1px solid #000;
      border-radius: 2px;
      &:where([type="submit"]):hover {
        background: rgba(0 0 0 / 0.5);
      }
    }
    body {
      background-color: transparent !important;
    }
    .seqdata > b {
      color: inherit !important;
    }
    picture > img.banner {
      filter: brightness(800%) hue-rotate(216deg) brightness(155%) brightness(93.7%) invert(100%);
    }

    div.footer {
      background: rgba(0 0 0 / 0.3);
    }
    div.motdbox {
      background-color: rgba(0 0 0 / 0.3);
    }
    div.line {
      background-color: #000;
    }
    div.seqhead {
      background-color: rgba(0 0 0 / 0.3);
    }
    div.resultbar {
      background-color: rgba(0 0 0 / 0.3);
    }
    div.resultline {
      background-color: #000;
    }
    div.loginbox {
      & form.email input {
        border-color: #000;
        color: inherit;
        &:focus {
          border-color: #000;
          box-shadow: none;
        }
      }
      & .rule::before, & .rule::after {
        background: currentColor;
      }
    }
  '';
}
