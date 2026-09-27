# Norm Homebrew Tap

[English](README.md)

使用 Homebrew 7 或更新版本时，先信任本项目维护的 Tap：

```sh
brew trust normlanguage/tap
```

安装 Norm 命令行工具链：

```sh
brew install normlanguage/tap/normlang
norm --version
```

使用 `brew upgrade normlang` 更新，使用 `brew uninstall normlang` 卸载。

支持的平台由 [Norm 发布目标](https://github.com/normlanguage/Norm/blob/main/cli/compiler/release-targets.json)定义。Formula 内容由 [Norm 发布流程](https://github.com/normlanguage/Norm/blob/main/docs/zh/design/release-process.md)生成。

[源码与文档](https://github.com/normlanguage/Norm) · [报告问题](https://github.com/normlanguage/Norm/issues)
