#import "../lib.typ": *
#import "./otr/utils.typ": *

#set page(margin: 2cm)
#set par(justify: true)

#show raw.where(block: false): set text(font: "Fira Code")

= Cuti Demo & Doc

== Introduction

Cuti is a package that simulates fake bold weight for fonts by utilizing the `stroke` attribute of `text`. This package is typically used on fonts that do not have a `bold` weight, such as "SimSun".

This package uses 0.02857em as the parameter for stroke. In Microsoft Office software, enabling fake bold will apply a border of about 0.02857em to characters. This is where the value of 0.02857em is derived from. (In fact, the exact value may be $1/35$.)

#line(length: 100%)

== fakebold

`fakebold(` \
#h(2em) `base-weight:` #typebox[none] #typebox[int] #typebox[str] default: #typebox[none] `,` \
#h(2em) #typebox[content] \
`)`

`#fakebold[]` with no parmerter will apply the #fakebold[fakebold] effect to characters.

#example(
  ```typst
  #import "@preview/cuti:0.1.0": fakebold

  - Fakebold: #fakebold[#lorem(5)]
  - Bold: #text(weight: "bold", lorem(5))
  - Bold + Fakebold: #fakebold[#text(weight: "bold", lorem(5))]
  ```
)

`#fakebold[]` has a `base-weight` parameter that can be used to specify a certain weight as the base weight for fake bold. By default, or when `base-weight` is `none`, the base weight will be inherited from the above context.

#example(
  ```typst
  #import "@preview/cuti:0.1.0": fakebold

  - Bold + Fakebold: #fakebold(base-weight: "bold")[#lorem(5)]
  - Bold + Fakebold: #set text(weight: "bold"); #fakebold[#lorem(5)]
  ```
)

#line(length: 100%)

== #regex-fakebold

`regex-fakebold(` \
#h(2em) `reg-exp:` #typebox[str] default: `"."` \
#h(2em) `base-weight:` #typebox[none] #typebox[int] #typebox[str] default: #typebox[none] `,` \
#h(2em) #typebox[content] \
`)`


The `#regex-fakebold` is designed to be used in multilingual and multi-font scenarios. It allows the use of a RegExp string as the `reg-exp` parameter to match characters that will have the fake bold effect applied. It also accepts the `base-weight` parameter.

#example(
  ```typst
  #import "@preview/cuti:0.1.0": regex-fakebold

  + RegExp `[a-o]`: #regex-fakebold(reg-exp: "[a-o]")[#lorem(5)]
  + RegExp `\p{script=Han}`: #regex-fakebold(reg-exp: "\p{script=Han}")[衬衫的价格是9磅15便士。] 
  + RegExp `\p{script=Han}`: #set text(weight: "bold"); #regex-fakebold(reg-exp: "\p{script=Han}")[衬衫的价格是9磅15便士。]
  ```
)

In Example \#3, `9` and `15` are the real bold characters from the font file, while the other characters are simulated as "fake bold" based on the `regular` weight.

#line(length: 100%)

== show-fakebold

`show-fakebold(` \
#h(2em) `reg-exp:` #typebox[str] default: `"."` \
#h(2em) `base-weight:` #typebox[none] #typebox[int] #typebox[str] default: #typebox[none] `,` \
#h(2em) #typebox[content] \
`)`

In multilingual and multi-font scenarios, different languages often utilize their own fonts, but not all fonts contain the `bold` weight. It can be inconvenient to use `#fakebold` or `#regex-fakebold` each time we require `strong` or `bold` effects. Therefore, the `#show-fakebold` function is introduced for `show` rule.

The `show-fakebold` function shares the same parameters as `regex-fakebold`. By default, `show-fakebold` will apply the RegExp `"."`, which means all characters with the `strong` or `weight: "bold"` property will be fakebolded if the corresponding show rule has been set.

#example(
  ```typst
  #import "@preview/cuti:0.1.0": show-fakebold

  #show: show-fakebold
  - Regular: #lorem(10)
  - Bold: #text(weight: "bold")[#lorem(10)]
  ```
)

Typically, the combination of bold + fakebold is not the desired effect. It is usually necessary to specify the RegExp to indicate which characters should utilize the fakebold effect.

#example(
  ```typst
  #import "@preview/cuti:0.1.0": show-fakebold

  #show: show-fakebold.with(reg-exp: "\p{script=Han}")
  - Regular: 我正在使用 Typst 排版。 
  - Strong: *我正在使用 Typst 排版。*
  ```
)

It also accepts the `base-weight` parameter.


#line(length: 100%)

== cn-fakebold & show-cn-fakebold

`cn-fakebold` and `show-cn-fakebold` are encapsulations of the above `regex-fakebold` and `show-fakebold`, pre-configured for use with Chinese text. Please refer to the Chinese documentation for detailed usage instructions.

`cn-fakebold(`#typebox[content]`)`

`show-cn-fakebold(`#typebox[content]`)`
