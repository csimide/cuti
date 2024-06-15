#import "../lib.typ": show-cn-fakebold
#show: show-cn-fakebold

= 宋体
#set text(12pt, font: "SongTi", weight: "regular")
测试8000试试

#set text(12pt, font: "SongTi", weight: "bold")
测试8000试试

#set text(12pt, font: ("Times New Roman", "SongTi"), lang: "zh", region: "cn", weight: "regular")
中英混：测试8000试试

#set text(12pt, font: ("Times New Roman", "SongTi"), lang: "zh", region: "cn", weight: "bold")
中英混：测试8000试试

= 楷体
#set text(12pt, font: "KaiTi", weight: "regular")
测试8000试试

#set text(12pt, font: "KaiTi", weight: "bold")
测试8000试试

#set text(12pt, font: ("Times New Roman", "KaiTi"), lang: "zh", region: "cn", weight: "regular")
中英混：测试8000试试

#set text(12pt, font: ("Times New Roman", "KaiTi"), lang: "zh", region: "cn", weight: "bold")
中英混：测试8000试试

= 新宋体

#set text(font: "SimSun", weight: "regular")
测试8000试试

#set text(font: "SimSun", weight: "bold")
测试8000试试

#set text(font: ("Times New Roman", "SimSun"), lang: "zh", region: "cn", weight: "regular")
中英混：测试8000试试

#set text(font: ("Times New Roman", "SimSun"), lang: "zh", region: "cn", weight: "bold")
中英混：测试8000试试