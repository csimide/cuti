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

#let regex-fakeitalic(reg-exp: ".", ang: -18.4deg, spacing: none, s) = {
  show regex(reg-exp): it => {
    box(place(skew(ax: ang, it)), baseline: -0.7em) + hide(it)
  }
  s
  if spacing != none {h(spacing)}
}

#let fakeitalic(ang: -18.4deg, s) = regex-fakeitalic(reg-exp: "[^ ]", ang: ang, s)
