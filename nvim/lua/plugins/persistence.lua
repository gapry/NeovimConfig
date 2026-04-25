return {
  "folke/persistence.nvim",

  event = "BufReadPre",

  opts = {
  },

  config = function(_, opts)
    local persistence = require("persistence")
    persistence.setup(opts)

    vim.api.nvim_create_autocmd("VimEnter", {
      nested = true,
      callback = function()
        if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
          vim.cmd("cd " .. vim.fn.fnameescape(vim.fn.argv(0)))
          vim.schedule(function() persistence.load() end)
        end
      end,
    })

    vim.keymap.set("n", "<leader>ss", function() persistence.load() end, { desc = "Restore Session" })
    vim.keymap.set("n", "<leader>sl", function() persistence.load({ last = true }) end, { desc = "Restore Last Session" })
    vim.keymap.set("n", "<leader>sd", function() persistence.stop() end, { desc = "Don't Save Current Session" })
  end,
}
