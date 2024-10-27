#let fakebold(base-weight: auto, s, ..params) = {
  assert(
    base-weight in (auto, none) or type(base-weight) in (str, int),
    message: "`base-weight` should be `auto`, `none`, `int` or `str` type.",
  )
  set text(weight: base-weight) if type(base-weight) in (str, int)
  set text(weight: "regular") if base-weight == auto
  set text(..params) if params != ()
  context {
    set text(stroke: 0.02857em + text.fill)
    s
  }
}

#let regex-fakebold(reg-exp: ".+", base-weight: auto, s, ..params) = {
  show regex(reg-exp): it => {
    fakebold(base-weight: base-weight, it, ..params)
  }
  s
}

#let show-fakebold(reg-exp: ".+", base-weight: auto, s, ..params) = {
  show text.where(weight: "bold").or(strong): it => {
    regex-fakebold(reg-exp: reg-exp, base-weight: base-weight, it, ..params)
  }
  s
}

#let cn-fakebold(s, ..params) = {
  regex-fakebold(reg-exp: "[\p{script=Han}！-･〇-〰—]+", base-weight: "regular", s, ..params)
}

#let show-cn-fakebold(s, ..params) = {
  show-fakebold(reg-exp: "[\p{script=Han}！-･〇-〰—]+", base-weight: "regular", s, ..params)
}

#let regex-fakeitalic(reg-exp: ".+?", ang: -18.4deg, s) = {
  show regex(reg-exp): it => {
    box(skew(ax: ang, reflow: false, it))
  }
  s
}

#let fakeitalic(
  ang: -18.4deg,
  s,
) = regex-fakeitalic(reg-exp: "(?:\b[^\p{Script=Han}\p{Script=Hiragana}\p{Script=Katakana}\p{Script=Hangul}！-･〇-〰—]+?\b|[\p{Script=Han}\p{Script=Hiragana}\p{Script=Katakana}\p{Script=Hangul}])", s)

#let fakesc(s, scaling: 0.75) = {
  show regex("\p{Ll}+"): it => {
    text(scaling * 1em, upper(it))
  }
  text(s)
}