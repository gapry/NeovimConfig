return {
  settings = {
    texlab = {
      build = {
        onSave = true,
        forwardSearchAfter = true,
        executable = "latexmk",
        args = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
          "%f",
        },
      },
      forwardSearch = {
        executable = "zathura",
        args = {
          "--synctex-forward",
          "%l:1:%f",
          "%p",
        },
      },
      chktex = {
        onOpenAndSave = true,
      },
    },
  },
}
