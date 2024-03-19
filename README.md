# Cuti

Cuti is a package that simulates fake bold weight for fonts by utilizing the `stroke` attribute of `text`. This package is typically used on fonts that do not have a `bold` weight, such as "SimSun".

## Usage

Please refer to the [English Demo & Doc](./demo-and-doc/demo-and-doc.pdf) located in the `demo-and-doc` directory for details.

本 Package 提供中文文档： [中文 Demo 与文档](./demo-and-doc/demo-and-doc-cn.pdf)。

### Getting Started Quickly (For Chinese User)

Please add the following content at the beginning of the document:

```typst
#import "@preview/cuti:0.1.0": show-cn-fakebold
#show: show-cn-fakebold
```

Then, the bolding for SimHei, SimSun, and KaiTi fonts should work correctly.

### `fakebold`

```typst
- Fakebold: #fakebold[#lorem(5)]
- Bold: #text(weight: "bold", lorem(5))
- Bold + Fakebold: #fakebold[#text(weight: "bold", lorem(5))]
```

```typst
- Bold + Fakebold: #fakebold(base-weight: "bold")[#lorem(5)]
- Bold + Fakebold: #set text(weight: "bold"); #fakebold[#lorem(5)]
```

### `regex-fakebold`

```typst
+ RegExp `[a-o]`: #regex-fakebold(reg-exp: "[a-o]")[#lorem(5)]
+ RegExp `\p{script=Han}`: #regex-fakebold(reg-exp: "\p{script=Han}")[衬衫的价格是9磅15便士。] \
+ RegExp `\p{script=Han}`: #set text(weight: "bold"); #regex-fakebold(reg-exp: "\p{script=Han}")[衬衫的价格是9磅15便士。]
```

### `show-fakebold`

```typst
#show text: show-fakebold
- Regular: #lorem(10)
- Bold: #text(weight: "bold")[#lorem(10)]
```

```typst
#show strong: show-fakebold.with(reg-exp: "\p{script=Han}")
- Regular: 我正在使用 Typst 排版。
- Strong: *我正在使用 Typst 排版。*
```

## License

MIT License

This package refers to the following content:

- [TeX and Chinese Character Processing: Fake Bold and Fake Italic](https://zhuanlan.zhihu.com/p/19686102)
- Typst issue [#394](https://github.com/typst/typst/issues/394)

Thanks to Enter-tainer for the assistance.
