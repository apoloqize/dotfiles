-- Minimal Go configuration - LSP handles most functionality
return {
  -- Go-specific keymaps and settings
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" },
    config = function()
      require("go").setup({
        -- Minimal setup, rely on LSP for main functionality
        lsp_cfg = false, -- Use our lsp.lua config instead
        lsp_gofumpt = false,
        lsp_on_attach = false,
        dap_debug = false, -- Keep minimal
      })
      
      -- Essential Go keymaps
      vim.keymap.set("n", "<leader>gr", ":GoRun<CR>", { desc = "Go Run" })
      vim.keymap.set("n", "<leader>gb", ":GoBuild<CR>", { desc = "Go Build" })
      vim.keymap.set("n", "<leader>gt", ":GoTest<CR>", { desc = "Go Test" })
      vim.keymap.set("n", "<leader>gf", ":GoTestFunc<CR>", { desc = "Go Test Function" })
    end,
    ft = "go",
  },
}
