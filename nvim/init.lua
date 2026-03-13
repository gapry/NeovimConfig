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

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })

vim.keymap.set("n", "<leader>q", "<cmd>wqa!<CR>", { desc = "Exit: Save and quit all" })

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local last_pos = vim.api.nvim_buf_get_mark(0, '"')
    if last_pos[1] > 0 and last_pos[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, last_pos)
    end
  end,
})

require("config.lazy")
