#let fakebold(base-weight: none, s, ..params) = {
  set text(weight: base-weight) if base-weight != none
  set text(weight: "regular") if base-weight == none
  set text(..params) if params != ()
  context {
    set text(stroke: 0.02857em + text.fill)
    s
  }
}

#let regex-fakebold(reg-exp: ".", base-weight: none, s, ..params) = {
  show regex(reg-exp): it => {
    fakebold(base-weight: base-weight, it, ..params)
  }
  s
}

#let show-fakebold(reg-exp: ".", base-weight: none, s, ..params) = {
  show text.where(weight: "bold").or(strong): it => {
    regex-fakebold(reg-exp: reg-exp, base-weight: base-weight, it, ..params)
  }
  s
}

#let cn-fakebold(s, ..params) = {
  regex-fakebold(reg-exp: "[\p{script=Han}！-･〇-〰—]", base-weight: "regular", s, ..params)
}

#let show-cn-fakebold(s, ..params) = {
  show-fakebold(reg-exp: "[\p{script=Han}！-･〇-〰—]", base-weight: "regular", s, ..params)
}

#let regex-fakeitalic(reg-exp: "\b.+?\b", ang: -18.4deg, s) = {
  show regex(reg-exp): it => {
    box(skew(ax: ang, reflow: false, it))
  }
  s
}

#let fakeitalic(ang: -18.4deg, s) = regex-fakeitalic(ang: ang, s)

#let fakesc(s) = {
  show regex("[\p{Lu}]"): text.with((10 / 8) * 1em)
  text(0.8em, upper(s))
}