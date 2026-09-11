{ lib, ... }:
{

  zh = "←";
  zj = "↓";
  zk = "↑";
  zl = "→";

  and = "∧";
  approx = "≈";
  del = "∂";
  exist = "∃";
  forall = "∀";
  ge = "≥";
  "in" = "∈";
  nf = "∞";
  integral = "∫";
  inter = "∩";
  le = "≤";
  minus = "−";
  model = "⊨";
  mp = "∓";
  not = "¬";
  "or" = "∨";
  pm = "±";
  prod = "∏";
  sqrt = "√";
  subset = "⊂";
  subseteq = "⊆";
  subsetne = "⊊";
  sum = "∑";
  tack = "⊢";
  union = "∪";

  ne = "≠";
  nge = "≱";
  nin = "∉";
  nle = "≰";
  nsubseteq = "⊈";
  nsubset = "⊄";
  ntack = "⊬";
  nmodel = "⊭";

  pf = "🎹";
  sax = "🎷";
  trb = "🪊";
  trp = "🎺";

  aa = "𝔸";
  bb = "𝔹";
  cc = "ℂ";
  dd = "𝔻";
  ee = "𝔼";
  ff = "𝔽";
  gg = "𝔾";
  hh = "ℍ";
  ii = "𝕀";
  jj = "𝕁";
  kk = "𝕂";
  ll = "𝕃";
  mm = "𝕄";
  nn = "ℕ";
  oo = "𝕆";
  pp = "ℙ";
  qq = "ℚ";
  rr = "ℝ";
  ss = "𝕊";
  tt = "𝕋";
  uu = "𝕌";
  vv = "𝕍";
  ww = "𝕎";
  xx = "𝕏";
  yy = "𝕐";
  zz = "ℤ";

  "^0" = "⁰";
  "^1" = "¹";
  "^2" = "²";
  "^3" = "³";
  "^4" = "⁴";
  "^5" = "⁵";
  "^6" = "⁶";
  "^7" = "⁷";
  "^8" = "⁸";
  "^9" = "⁹";

  "_0" = "₀";
  "_1" = "₁";
  "_2" = "₂";
  "_3" = "₃";
  "_4" = "₄";
  "_5" = "₅";
  "_6" = "₆";
  "_7" = "₇";
  "_8" = "₈";
  "_9" = "₉";
}
// lib.listToAttrs (
  map (
    v:
    let
      hex = lib.substring 1 4 (lib.toLower (lib.toHexString (v + 65536)));
    in
    {
      name = "u${hex}";
      value = builtins.fromJSON "\"\\u${hex}\"";
    }
  ) ((lib.range 1 55295) ++ (lib.range 57344 64975) ++ (lib.range 65008 65533))
)
