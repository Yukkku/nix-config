{ writeText, ... }: {
  matches = [
    "https://*.mediawiki.org/*"
    "https://*.wikibooks.org/*"
    "https://*.wikidata.org/*"
    "https://*.wikifunctions.org/*"
    "https://*.wiktionary.org/*"
    "https://*.wikimedia.org/*"
    "https://*.wikipedia.org/*"
    "https://*.wikiquote.org/*"
    "https://*.wikisource.org/*"
    "https://*.wikiversity.org/*"
    "https://*.wikivoyage.org/*"
  ];
  js = writeText "custom.js" ''
    const html = document.documentElement;
    const setTheme = () => {
      const { classList } = html;
      if (classList.contains("skin-theme-clientpref-night")) return;
      classList.remove("skin-theme-clientpref-day");
      classList.remove("skin-theme-clientpref-os");
      classList.add("skin-theme-clientpref-night");
    };

    setTheme();
    new MutationObserver(setTheme).observe(html, { attributes: true });
  '';
  css = writeText "custom.css" ''
    :root {
      --background-color-base: rgba(0 0 0 / 0.5) !important;
      --background-color-neutral-subtle: transparent !important;
      --background-color-interactive: rgba(0 0 0 / 0.3) !important;
      --background-color-interactive-subtle: transparent !important;
      --background-color-interactive-subtle--hover: rgba(0 0 0 / 0.3) !important;
      --background-color-interactive-subtle--active: rgba(0 0 0 / 0.5) !important;
    }

    header, .mw-page-container, .vector-pinned-container, .cdx-text-input__input {
      background: none !important;
    }
    .vector-sticky-pinned-container::after {
      background: none !important;
    }
  '';
}
