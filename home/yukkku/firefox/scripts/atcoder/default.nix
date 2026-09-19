{ writeText, ... }: [
  {
    matches = [ "https://atcoder.jp/*" ];
    css = ./main.css;
  }
  {
    matches = [ "https://atcoder.jp/contests/*" ];
    js = writeText "script.js" ''
      localStorage.setItem("ace-options", JSON.stringify({ theme: 'ace/theme/monokai' }));
    '';
    css = ./contest.css;
  }
  {
    matches = [ "https://atcoder.jp/users/*" ];
    js = writeText "script.js" ''
      const s = document.createElement('script');
        s.innerHTML = `
          document.querySelector('script').remove();
          const c = Symbol();
          Object.defineProperty(Object.prototype, 'color', {
            get() {
              const v = this[c];
              if (v === '#000' && typeof this.text === 'string' && !/^Highest: \\d+$/.test(this.text)) {
                return '#fff';
              }
              return v;
            },
            set(v) {
              this[c] = v;
            },
          });
        `;
        document.documentElement.append(s);
    '';
  }
  {
    matches = [ "https://atcoder.jp/" ];
    js = writeText "script.js" ''
      location.pathname = '/home';
    '';
  }
]
