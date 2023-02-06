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



终端/写代码字体推荐： Nerd Font：支持更多的icon
+ firacode：好看的light字体
or jetbrainsmono：支持thin和light，但是在vim下对icon的支持不太好



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



**treesitter无法正常下载**

解决办法：设置代理，在官方文档中搜proxy即可



**Keysound在mac上难以安装**

未安装的插件，因为mac m1对sdl2的支持不太好



**terminal mode下代码补全影响tab**

cmp-path和cmp-cmdline在命令行模式下会影响tab的输出，它会将\^I变成\^Z，如果需要使用\^I，可以先\^V再tab



**packer**

管理其他的插件

Bug：在配置脚本中，有一个use.config的选项，它主要是在加载完插件后执行一些代码，可以设置为string或function，这里设置成string的话，底层会调用loadstring将其转换为执行脚本，但是如果设置为function且通过变量间接传递的话，则无法正常执行，猜测可能是底层直接将function转化为string再处理，也可能是执行时回调的函数已经丢失。

解决办法：传递要执行指令的string而不是function



**一些插件修改后不能正常更新**

需要重新编译一下PackerCompile plugin-name



**插件快照管理**

为了防止插件更新出现错误，需要定时创建版本快照，此时需要设置packer.init参数中的snapshots和path，packer在加载完后会自动回滚到该版本，因此平时可以将其关掉，当需要主要更新的内容发生失败时再使用rollback指令

在使用Sync和Update指令更新插件时，为了防止自动更新，可以设置preview\_update选项预览更新内容



**dashboard的配置**

显示界面的插件，目前仍在大量更新，这导致有些功能不够稳定，目前还是使用较旧的主题。支持打开项目、最近的文件、文件搜索、修改配置等



**主题相关**

tokyonight的设置和加载问题：在plugins的config中单独加载有问题，放到colorscheme中能解决。对应的commit： 2af2894645c0055d22bb21203f2d5afefd6d3621



**全局查找和替换**

Quickfix + vimgrep 可以实现全局查找和替换，具体方法参考《Vim使用技巧》

```bash
:vimgrep /word/   \*\*/\*.suffix
:cfdo %s/word/new_word/gc
:cfdo update
``````



**autopiars和coc completion_confirm冲突**

两者在回车键上发生冲突，导致无法确认补全

解决：https://github.com/windwp/nvim-autopairs/wiki/Completion-plugin



**查询按键映射**

```bash
:verbose [i]map somekey
```



**omnisharp没有及时更新项目**

- mason自带的：omnisharp-mono，生成文件后不能识别

- Coc自带的：coc-omnisharp 不支持macOS

- 独立的：omnisharp-vim 有ReloadProject，但是只在Coc中生效

- Dotnet相关的不能用

综合来看，目前使用coc+omnisharp-vim的方式，在添加、更改文件后使用ReloadProject指令更新代码补全和诊断功能



**什么是undo level？它有什么用？**

即撤销的级别或者粒度，在插入模式下，整个插入的操作序列都算做一个undo，这时可以通过break undo level来结束当前的undo，然后重新开始一个undo

[How to change undo granularity in Vim? - Vi and Vim Stack Exchange](https://vi.stackexchange.com/questions/2376/how-to-change-undo-granularity-in-vim)



**surround-nvim在插入模式下无法正常操作？**

可能是某个键发生冲突造成的乱码



**重新载入vim？**

[How to reload neovims init.vim without restarting neovim - Vi and Vim Stack Exchange](https://vi.stackexchange.com/questions/26626/how-to-reload-neovims-init-vim-without-restarting-neovim)

使用source $MYVIMRC，可以绑定快捷键 \<leader>sv



**buffer vs tab vs window？**

大致来说，Buffer 负责保存数据，Window 负责展示数据，Tab 为 Window 提供排版布局，Buffer 和 Tab 对 Window 总是一对多的关系

[(102条消息) [Vim\]如何理解并正确使用 Vim 中的 Buffer、Window 和 Tab_GanZiQim的博客-CSDN博客_vim 什么时候用windows 什么时候用buffer](https://blog.csdn.net/jy692405180/article/details/79775125)

[editor - Using Vim's tabs like buffers - Stack Overflow](https://stackoverflow.com/questions/102384/using-vims-tabs-like-buffers#:~:text=Vim %3Ahelp window explains the confusion "tabs vs,so the name tab in vim maybe misleading.)



**bufferline的buffer separator color和tokyonight不兼容**

[[Bug\]: The color of the empty space on the right side of the last tab is not consistent with the separator color after upgrading to v2.7.0 · Issue #517 · akinsho/bufferline.nvim (github.com)](https://github.com/akinsho/bufferline.nvim/issues/517)

作者认为是插件加载的顺序问题，但我的测试依然无法产生正确的效果，因此暂时搁置该特性



**telescope无法预览？**

其实是因为窗口太小或者字体太大，我认为这是插件设计的问题，当看不见预览功能时，首先想到的一定是插件设置是否出现了问题，作者至少应该在readme或者其他地方给出明显的提示！！（当然也可能是我没看到，但这一定是它不够明显）



**StatusLine颜色修改的问题？**

在默认的Nvim中，可以通过``verbose hi StatusLine``来查看当前的设置，如果需要将其修改为透明，需要设置``hi StatusLine cterm=NONE, gui=NONE``，此时背景就和终端相同

在主题tokyonight中，可以在on_highlights函数或者on_colors中设置，具体设置见：

[tokyonight.nvim/theme.lua at main · folke/tokyonight.nvim (github.com)](https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/theme.lua)



**如何快速定位UI颜色相关的问题？**

确定是哪个group出现了问题：直接使用telescope highlights搜索，或者verbose hi group-name

调整颜色，测试该group是否是关心的

切换不同的主题，定位颜色问题是出在主题上还是nvim本身上，比如statusline的颜色可能直接来自于Nvim主题自身的配置，winbar和tabline也经常和nvim自身有关，之后再确定是否和插件本身的设置有关

关于highlight的各种概念，可以参考这篇文章：[VIM学习笔记 语法高亮 (Syntax Highlight) - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/25292625)



**nvim和project.nvim无法正常同步？**

见设置：[ahmedkhalf/project.nvim: The superior project management solution for neovim. (github.com)](https://github.com/ahmedkhalf/project.nvim#-features)



**vim变量替换？**

有时候需要保留原字符串中的一些内容，这时可以给其制定变量，例如

func(args) -> args

可以使用

```bash
:s/func(\(.*\))/\1/g
```

[神级编辑器 Vim 使用-正则替换篇 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/346058975)



**按键显示<80>u^D..是怎么回事？**

猜测可能是按键冲突，也可能是有多个映射，比如安装which-key后\<C-w\>就会变成这样，暂时没有发现什么大的影响



**如何查看当前的workspace？**

```bash
:lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
```



**lua workspace diagnostics无法显示所有文件中的问题？**

这似乎是lua server的原因，它只会显示打开过的文件里的错误



**如何查看buffer list里面的文件是否修改？**

处于修改状态的文件前面会有一个加号



**为什么搜索高亮被修改了？**

有些主题会修改你的默认配置，比如下面这个插件就开启了搜索高亮：

[Highlight colors · mg979/vim-visual-multi Wiki (github.com)](https://github.com/mg979/vim-visual-multi/wiki/Highlight-colors)

修改：最初我也以为只是一个小问题，但是深入调查后，我发现，作者的源码中已经对这个问题做了修改，即只有在multi-cursor模式下才会暂时性地被修改为hls，在退出模式后设置为之前的值

按道理来说，这个逻辑是没有问题的，但是在我的配置中出现了奇怪的情况：大部分没有打开过的文档hls是正常关闭的，但是少数经常用的文档hls始终不受我的代码逻辑影响，在哪里加配置都没用

猜测：首先怀疑nvim的cache问题，因为该问题并不是针对所有文档都有效果的，我之后又查了一下hls的属性，发现它是全局的，因此判断在配置上应该没有什么大问题。之后我又怀疑了是否和加载顺序有关，是否因为一些插件的异步加载导致我的配置被覆盖，但是后来我发现，这和插件加载没有什么大的关系，因为我关闭所有插件后依然会出现，最后，我只能每个模块每个模块地去试，最后才在autocmds.lua中找到了问题，即在BufWinEnter时，会执行loadview指令，加载一些配置项，这个配置项覆盖了默认的配置，如果不修改的话，在这次关闭时又会把这些配置保存到本地，下次加载同样的配置。

总结下来，基本就是配置本地保存和自动加载的原因，确实跟cache有很大的关系

解决方法：暂时还不确定是不是真的对所有情况都有效，可以先配置好需要的选项，然后手动:mkview，之后再加载起来就好了

参考资料：

[(1) Does neovim have an equivalent of "vimfiles" : neovim (reddit.com)](https://www.reddit.com/r/neovim/comments/688980/does_neovim_have_an_equivalent_of_vimfiles/)

这个没搞清楚怎么配：

[Vim specific mkview and loadview in order to avoid issues - Stack Overflow](https://stackoverflow.com/questions/26917336/vim-specific-mkview-and-loadview-in-order-to-avoid-issues)



**live_grep失效？**

原因：telescope无法找到ripgrep，可以通过``g<``来查看输出的信息：

[VIM学习笔记 信息(message) - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/161370897)

这主要是因为conda改变了环境，导致找不到rg



**lspsaga的finder无法正常跳转？**

暂时不清楚具体原因，但是将autocmds中的mkview的触发时机改成BufWrite就好了



## 计划

- 使用界面管理各个功能：[liuchengxu/vim-which-key: Vim plugin that shows keybindings in popup (github.com)](https://github.com/liuchengxu/vim-which-key) √
- 




!!!!!!!!!!!!!!!!!!!!
!!! 没事别瞎更新 !!!
!!!!!!!!!!!!!!!!!!!!
