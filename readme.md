# Neovim配置

**选择Neovim的原因？**

Neovim具有更好的扩展性，能够自由地定制化很多功能和插件。相比于大型的IDE，Neovim很适合快速打开多个小文件、小项目，和命令行的交互也更优秀，能够结合起来处理文件和文本；相比于VSCode，Neovim的定制化程度更高，在快捷键设置、窗口布局等方面有更多的配置方案，在简单文本的批处理方面，Vim的功能更加强大，操作起来也更加统一。

但是，Neovim也有一些传统Vim所具有的缺点：

- 学习周期较长，每次增加插件时也需要记忆新的操作方法，但好处是，这些操作形成习惯后就基本不会有什么大的变化了，不像其他的编辑工具之间操作不兼容。
- 配置快捷键和插件功能的过程比较繁琐。由于Neovim使用的基本是开源插件，因此在插件的质量和问题修复上不能得到比较系统的保证，插件和插件之间也可能存在兼容的问题，如果某个插件的文档描述的不清楚，则使用者需要花费大量精力去研究某个配置项的具体功能含义，如果遇到比较棘手的问题，也只能通过阅读源代码的方式来排查问题，对于大量的动态语言而言，这是非常令人头疼的一件事 :(
- 不适合做编辑以外的工作。相比于IDE，Neovim在编译、运行、调试等方面依然需要依赖大量的插件，并且效果也很难比IDE要好，配置起来也比文本编辑相关的插件更加麻烦，因此，我认为要么仅仅使用Neovim进行编辑，把运行调试的工作交给专业的IDE或者命令行，要么在IDE中装入好用的Vim插件

总而言之，对于Neovim的学习和配置是一个长期积累的过程，它能够帮助你形成一套基于Vim哲学的文本编辑习惯，研究对于自己而言效率更高的编辑辅助工具，日常工作中更多的是将Neovim和其他IDE混用，在遇到具体问题时能够使用最合适的工具和功能来进行解决，以达到提高效率、享受生活的最终目的 :)



## 项目结构
```bash
├── init.lua							-- 入口脚本，加载所有配置脚本
├── lua/
│   ├── autocmds.lua					-- 特定条件下自动运行的命令
│   ├── basic.lua						-- vim的基本配置，如行缩进、行号显示
│   ├── cmp/							-- 代码补全
│   ├── colorscheme.lua					-- 主题配置
│   ├── global_configs.lua				-- 全局设置，主要是插件源、按键配置
│   ├── keybindings.lua					-- 通用的按键映射
│   ├── lsp/							-- LSP配置
│   ├── plugin-config/					-- 每个插件的额外配置脚本，方便管理
│   ├── plugins.lua						-- 插件安装和加载
│   └── utils/							-- 通用工具
├── readme.md
└── snapshots							-- 插件的版本快照，如果更新出现问题，则可以回退到之前的版本
```



## 问题归档

### Shell相关

**Oh-my-zsh安装过程以及备份注意事项**

根据官网的步骤下载Oh-my-zsh，此时会生成.zshrc.pre-oh-my-zsh，该文件为之前.zshrc的备份文件，如果有必要，将该文件的内容复制到新的.zshrc中，比如conda的环境加载

卸载方法：查看官方文档



**主题设置**

下载主题，比如powerlevel10k，按照官方步骤安装，然后下载字体（官方推荐）



**插件设置**

下载其他插件，例如命令补全、语法高亮，基本都是clone到oh-my-zsh的plugins文件夹下，然后在.zshrc的plugin里添加，大部分插件的readme中有更加详细的方法介绍



**autojump**

快速跳转到某个同名的文件或文件夹，使用brew安装和管理



**zsh-autosuggestion**

命令补全，使用Ctrl + E(^E)来补全

Mac查看快捷键对应的字符序列的方法：

[**macos - Binding Fn-Delete in zsh on Mac OS X - Super User**](https://superuser.com/questions/169920/binding-fn-delete-in-zsh-on-mac-os-x/169930#169930)



**zsh-vi-mode**

更改命令行模式，使其和vim的输入相同

Bug：[**zvm doesn't work after source .zshrc · Issue #169 · jeffreytse/zsh-vi-mode (github.com)**](https://github.com/jeffreytse/zsh-vi-mode/issues/169)

解决方案：使用omz reload重启



**Iterms2**

Mac终端，替换掉原生的终端，有更多的功能，且快捷键也更好配置

[**使用 iTerm2 打造美观高效的 Mac 终端 - 腾讯云开发者社区-腾讯云 (tencent.com)**](https://cloud.tencent.com/developer/article/1772592)

[**Mac-iTerm2安装、配置和使用-知乎(zhihu.com)**](https://zhuanlan.zhihu.com/p/435518571)

使用字体：[ryanoasis/nerd-fonts: Iconic font aggregator, collection, & patcher. 3,600+ icons, 50+ patched fonts: Hack, Source Code Pro, more. Glyph collections: Font Awesome, Material Design Icons, Octicons, & more (github.com)](https://github.com/ryanoasis/nerd-fonts/#font-installation)

该字体能够正确显示许多emoji的字符，在vim的配置中也使用这种字体

其他：

Terminal自带的翻页不好使，可以在设置中将其改为option + jk的方式



大小写键有时比较鸡肋，可以将其换成Control键，方法：

System Preference -> Keyboard -> Modifier Keys -> 修改



Mac系统没有Alt键，NeoVim无法识别Cmd键，可以在Iterm2中设置Option键为meta键，方法：

Preference -> Profiles -> Default --> Keys --> Left Option key --> 选中 Esc+



**按键相关**

要查看快捷键的话，使用bindkey -l找到keymap，再在对应的map下查找，方法为bindkey -M mapname



**备份相关**

记住使用的插件名称，备份.zshrc文件，一般来说，用不上所有的内容，主要是：

- 插件名称
- conda启动配置
- Autojump的启动配置
- 自己设置的变量别名
- 绑定的键位



### Vim相关

**配置教程**

[**Neovim配置实战：从0到1打造自己的IDE - nshen -掘金小册(juejin.cn)**](https://juejin.cn/book/7051157342770954277?utm_source=post_pay_page)



配置选项：帮助、当前值、在哪个文件设置、使用命令切换

[**linux - vim技巧：查看某个配置项的值、以及它被哪个文件所设置-南木阁- SegmentFault思否**](https://segmentfault.com/a/1190000021029471)



**Telescope & treesitter无法正常折叠**

[File opened with Telescope: find_files can't be folded (E490: No fold found) · Issue #699 · nvim-telescope/telescope.nvim (github.com)](https://github.com/nvim-telescope/telescope.nvim/issues/699)

解决方法：先适用zx重置，再使用zc折叠



**Keysound在mac上难以安装**

未安装的插件，因为mac m1对sdl2的支持不太好



**terminal mode下代码补全影响tab**

cmp-path和cmp-cmdline在命令行模式下会影响tab的输出，它会将\^I变成\^Z，如果需要使用\^I，可以先\^V再tab



**packer**

管理其他的插件

Bug：在配置脚本中，有一个use.config的选项，它主要是在加载完插件后执行一些代码，可以设置为string或function，这里设置成string的话，底层会调用loadstring将其转换为执行脚本，但是如果设置为function且通过变量间接传递的话，则无法正常执行，猜测可能是底层直接将function转化为string再处理，也可能是执行时回调的函数已经丢失。

解决办法：传递要执行指令的string而不是function



**dashboard的配置**

显示界面的插件，目前仍在大量更新，这导致有些功能不够稳定，目前还是使用较旧的主题。支持打开项目、最近的文件、文件搜索、修改配置等



**主题相关**

tokyonight的设置和加载问题：在plugins的config中单独加载有问题，放到colorscheme中能解决。对应的commit： 2af2894645c0055d22bb21203f2d5afefd6d3621



**全局查找和替换**

Quickfix + vimgrep 可以实现全局查找和替换，具体方法参考《Vim使用技巧》

```bash
:vimgrep /word/   \*\*/\*.suffix
:cfdo %s/word/new word/gc
:cfdo update
``````


**一些插件修改后不能正常更新**

需要重新编译一下PackerCompile plugin-name


