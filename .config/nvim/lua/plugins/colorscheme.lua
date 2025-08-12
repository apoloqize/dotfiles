return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false,
  priority = 1000, -- Load before other plugins
  keys = {
    { "<leader>tt", function()
      if vim.o.background == "dark" then
        vim.o.background = "light"
        vim.cmd("colorscheme github_light_default")
      else
        vim.o.background = "dark"
        vim.cmd("colorscheme github_dark_default")
      end
    end, desc = "Toggle dark/light theme" },
  },
  config = function()
    require("github-theme").setup({
      options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/github-theme",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
        hide_nc_statusline = true, -- Override the underline style for non-active statuslines
        transparent = false,       -- Disable setting background
        terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false,      -- Non focused panes set to alternative background
        module_default = true,     -- Default enable value for modules
        styles = {                 -- Style to be applied to different syntax groups
          comments = "italic",     -- Value is any valid attr-list value `:help attr-list`
          functions = "NONE",
          keywords = "bold",
          variables = "NONE",
          conditionals = "NONE",
          constants = "NONE",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "NONE",
        },
        inverse = {                -- Inverse highlight for different types
          match_paren = false,
          visual = false,
          search = false,
        },
      },
      palettes = {},
      specs = {},
      groups = {},
    })

    -- Set default theme
    vim.o.background = "dark"
    vim.cmd("colorscheme github_dark_default")
  end,
}
