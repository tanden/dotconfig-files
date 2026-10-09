# dotconfig-files

個人用の dotfiles。

## Ghostty (macOS)

設定は `ghostty/config`。`~/.config/ghostty/config` からシンボリックリンクで参照する。

```sh
mkdir -p ~/.config/ghostty
ln -s "$(pwd)/ghostty/config" ~/.config/ghostty/config
```

`~/Library/Application Support/com.mitchellh.ghostty/config` にも設定があると、そちらが優先されるので置かない。

設定後は `Cmd+Shift+,` で再読み込みする。

### フォント

[Moralerspace](https://github.com/yuru7/moralerspace) の Xenon HW (半角 1 : 全角 2 幅) を使う。

1. [Releases](https://github.com/yuru7/moralerspace/releases) から `MoralerspaceHW_v*.zip` をダウンロードする
2. `MoralerspaceXenonHW-*.ttf` を `~/Library/Fonts` にコピーする
