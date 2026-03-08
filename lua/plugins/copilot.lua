return {
  "github/copilot.vim",

  cmd = "Copilot",

  event = "InsertEnter",

  config = function()
    vim.g.copilot_enabled = 0

    vim.g.copilot_no_tab_map = true
    
    vim.keymap.set("i", "<C-L>", 'copilot#Accept("<CR>")', {
      silent = true,
      expr = true,
      replace_keycodes = false,
      desc = "Copilot: Accept suggestion"
    })

    vim.keymap.set("n", "<leader>ce", function()
      if vim.g.copilot_enabled == 1 then
        vim.cmd("Copilot disable")
        print("GitHub Copilot Disabled")
      else
        vim.cmd("Copilot enable")
        print("GitHub Copilot Enabled")
      end
    end, { desc = "AI: Toggle Copilot" })
  end,
}

