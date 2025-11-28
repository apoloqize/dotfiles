vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10

require("config.lazy")

-- Colorscheme
vim.cmd.colorscheme("gruvbox-material")

-- Keybindings
-- Toggle Oil file explorer
local function toggle_oil()
  if vim.bo.filetype == "oil" then
    vim.cmd("bd")  -- Close Oil buffer
  else
    vim.cmd("Oil")  -- Open Oil
  end
end

vim.keymap.set("n", "<leader>e", toggle_oil, { desc = "Toggle file explorer" })
