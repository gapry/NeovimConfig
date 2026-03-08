vim.g.mapleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.clipboard = "unnamedplus"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.fileencodings = { "utf-8", "ucs-bom", "latin1", "cp1252" }

require("config.lazy")

