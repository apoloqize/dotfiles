return {
  "polirritmico/monokai-nightasty.nvim",
  lazy = false,
  priority = 1000, -- Load before other plugins
  keys = {
    { "<leader>tt", "<Cmd>MonokaiToggleLight<CR>", desc = "Monokai-Nightasty: Toggle dark/light theme." },
  },
  ---@module "monokai-nightasty"
  ---@type monokai.UserConfig
  opts = {
    dark_style_background = "default", -- default | dark | transparent | #RRGGBB
    light_style_background = "default", -- default | dark | transparent | #RRGGBB
    hl_styles = {
      comments = { italic = true },
      keywords = { italic = false },
      functions = {},
      variables = {},
      floats = "default", -- default, dark, transparent
      sidebars = "default", -- default, dark, transparent
    },
    color_headers = false,
    dim_inactive = false,
    lualine_bold = true,
    lualine_style = "default",
    markdown_header_marks = false,
    terminal_colors = true,
    auto_enable_plugins = true,
    plugins = {
      all = true, -- Enable all supported plugins
    },
  },
  config = function(_, opts)
    vim.opt.cursorline = true -- Highlight line at the cursor position
    vim.o.background = "dark" -- Default to dark theme
    
    require("monokai-nightasty").load(opts)
  end,
}
