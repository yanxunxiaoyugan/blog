# NexT for Typora

![image-20200423021248443](https://billc.oss-cn-shanghai.aliyuncs.com/img/2020-04-23-image-20200423021248443.png)

<p align="center">π An elegant and simple Typora theme, inpired by Hexo theme <a href = 'https://github.com/theme-next/hexo-theme-next'>NexT</a>.
    <br /><img alt="GitHub All Releases" src="https://img.shields.io/github/downloads/BillChen2K/typora-theme-next/total?style=flat">  <img alt="GitHub release (latest by date)" src="https://img.shields.io/github/v/release/BillChen2K/typora-theme-next"></p>

## Features

English πΊπΈ & δΈ­ζ π¨π³ supported, `JetBrains Mono` as mono font. 

NexT is one of the most powerful and elegant themes for hexo. This is a transplanted version of NexT on Typora, with English font `Overpass` and Chinese font `Glow Sans` ([ζͺζ₯θ§ι»](https://github.com/welai/glow-sans))οΌa modern and concise Chinese font by Zhejiang University.

This theme includes styles for typos, underline, checkbox and sidebar, and a Helvetica version for fans of classic fonts. Tuned for both macOS and Windows, and now with a dark version:

![image-20200529142243531](https://billc.oss-cn-shanghai.aliyuncs.com/img/2020-05-29-yvVEHP.png)

## Usage

There will be four css files, drag whichever css file you like <u>& next folder</u> to your Typora theme folder and restart Typora.

Helvetica font would look more constraint and academic. For fans of Helvetica, both light and dark theme have a Helvetica version. Note that line height in Helvetica version is slightly tightened for better appearance.

Code [ligatures](https://www.jetbrains.com/lp/mono/)  in JetBrains Mono are disabled by default. If you want it on, just find  `font-variant-ligatures: none;` in the css files and comment that line.

If you want to change the font size of exported files (like pdf or docx), edit `export-font-size` variable in the css files.

## Example

Inline styles support **strong**, *Emphasis*, `code`, <u>underline</u>, ~~strikethrough~~, $\LaTeX$, X^2^, H~2~O, ==highlight==, [Link](typora.io), and emojiπγ

- With fully Chinese supportοΌδ½Ώη¨ζͺζ₯θ§ι»ε­δ½ζΎη€ΊδΈ­ζζε­γ
  
  - δΈ­ζε­δ½ζηζζζ―δ»δΉζ ·ε­οΌθ¦θ§£ε³θΏδΈͺι?ι’οΌι¦ειθ¦ιδΎΏεε€δΈδΊη?δ½ζ±ε­οΌηΆεζδ»δ»¬ζΎε¨θΏιοΌεε°ε¦ε ε₯γ
- And an elegant English font: Overpass.
- Everybody loves `JetBrains Mono`.
- [x] Check box styled.

```c
#include <iostream>
int main(){
  std::cout << "Hello World!" << end;
}
```

| Table | Style | Of   | NexT |
| ----- | ----- | ---- | ---- |
| Is    | Shown | Here | .    |

## Notes

> Glow Sans font would look better on HiDPI screens. If you donβt have one and had a bad experience, you can delete Glow Sans font under the `next` folder and it will use your Microsoft YaHei or PingFang to render Chinese. 

Author: Bill Chen ([https://billc.io](https://billc.io)) β΅οΈ

2020.4