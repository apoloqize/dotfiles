return {
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  lazy = false,
  priority = 997,
  keys = {
    { "<leader>tgd", function()
      vim.o.background = "dark"
      vim.cmd("colorscheme gruvbox")
    end, desc = "Switch to Gruvbox Dark" },
    
    { "<leader>tgl", function()
      vim.o.background = "light"
      vim.cmd("colorscheme gruvbox")
    end, desc = "Switch to Gruvbox Light" },
    
    { "<leader>tgt", function()
      if vim.o.background == "dark" then
        vim.o.background = "light"
      else
        vim.o.background = "dark"
      end
      vim.cmd("colorscheme gruvbox")
    end, desc = "Toggle Gruvbox dark/light" },
  },
  config = function()
    require("gruvbox").setup({
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    })
  end,
}
