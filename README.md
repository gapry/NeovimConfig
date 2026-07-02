## Install

```bash
$ curl -sL https://raw.githubusercontent.com/gapry/NeovimConfig/main/utils/install.sh | bash
```

## Development

```bash
$ make format  # format lua sources with stylua
$ make local   # sync local changes to ~/.config/nvim for quick testing
$ make plugins # headless install/sync plugins and treesitter
$ make install # test the curl remote installation
```
