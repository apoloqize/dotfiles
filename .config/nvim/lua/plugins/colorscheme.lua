-- Main colorscheme configuration with switcher
return {
  -- Include GitHub theme
  require("plugins.github-theme"),
  
  -- Include Monokai Pro theme
  require("plugins.monokai-pro"),
  
  -- Include Gruvbox theme
  require("plugins.gruvbox"),
  
  -- Colorscheme switcher utility
  {
    "colorscheme-switcher",
    dir = vim.fn.stdpath("config"),
    lazy = false,
    priority = 500,
    keys = {
      { "<leader>cs", function()
        local themes = {
          { name = "GitHub Dark", cmd = "github_dark_default" },
          { name = "GitHub Light", cmd = "github_light_default" },
          { name = "Monokai Pro", cmd = "monokai-pro" },
          { name = "Gruvbox Dark", cmd = "gruvbox", bg = "dark" },
          { name = "Gruvbox Light", cmd = "gruvbox", bg = "light" },
        }
        
        -- Store current colorscheme to restore if cancelled
        local current_colorscheme = vim.g.colors_name
        local current_background = vim.o.background
        
        -- Create a custom picker with live preview
        local function interactive_colorscheme_picker()
          local pickers = require("telescope.pickers")
          local finders = require("telescope.finders")
          local conf = require("telescope.config").values
          local actions = require("telescope.actions")
          local action_state = require("telescope.actions.state")
          
          pickers.new({}, {
            prompt_title = "Colorschemes (Live Preview)",
            finder = finders.new_table({
              results = themes,
              entry_maker = function(entry)
                return {
                  value = entry,
                  display = entry.name,
                  ordinal = entry.name,
                }
              end,
            }),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(prompt_bufnr, map)
              -- Live preview on cursor move
              local function preview_colorscheme()
                local selection = action_state.get_selected_entry()
                if selection and selection.value then
                  local theme = selection.value
                  if theme.bg then
                    vim.o.background = theme.bg
                  end
                  vim.cmd("colorscheme " .. theme.cmd)
                end
              end
              
              -- Apply colorscheme on selection
              actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                if selection and selection.value then
                  local theme = selection.value
                  if theme.bg then
                    vim.o.background = theme.bg
                  end
                  vim.cmd("colorscheme " .. theme.cmd)
                  vim.notify("Switched to " .. theme.name, vim.log.levels.INFO)
                end
                actions.close(prompt_bufnr)
              end)
              
              -- Restore original colorscheme on cancel
              actions.close:enhance({
                post = function()
                  -- Only restore if we're cancelling (not selecting)
                  local selection = action_state.get_selected_entry()
                  if not selection then
                    vim.o.background = current_background
                    if current_colorscheme then
                      vim.cmd("colorscheme " .. current_colorscheme)
                    end
                  end
                end,
              })
              
              -- Set up cursor move callback for live preview
              vim.api.nvim_create_autocmd("CursorMoved", {
                buffer = prompt_bufnr,
                callback = preview_colorscheme,
              })
              
              return true
            end,
          }):find()
        end
        
        -- Check if telescope is available, fallback to vim.ui.select
        local ok, _ = pcall(require, "telescope")
        if ok then
          interactive_colorscheme_picker()
        else
          -- Fallback to standard vim.ui.select
          vim.ui.select(themes, {
            prompt = "Select colorscheme:",
            format_item = function(item)
              return item.name
            end,
          }, function(choice)
            if choice then
              if choice.bg then
                vim.o.background = choice.bg
              end
              vim.cmd("colorscheme " .. choice.cmd)
              vim.notify("Switched to " .. choice.name, vim.log.levels.INFO)
            end
          end)
        end
      end, desc = "Interactive colorscheme switcher with live preview" },
      
      { "<leader>cg", function()
        vim.cmd("colorscheme github_dark_default")
        vim.notify("Switched to GitHub Dark", vim.log.levels.INFO)
      end, desc = "Switch to GitHub Dark" },
      
      { "<leader>cl", function()
        vim.cmd("colorscheme github_light_default")
        vim.notify("Switched to GitHub Light", vim.log.levels.INFO)
      end, desc = "Switch to GitHub Light" },
      
      { "<leader>cm", function()
        vim.cmd("colorscheme monokai-pro")
        vim.notify("Switched to Monokai Pro", vim.log.levels.INFO)
      end, desc = "Switch to Monokai Pro" },
      
      { "<leader>cgd", function()
        vim.o.background = "dark"
        vim.cmd("colorscheme gruvbox")
        vim.notify("Switched to Gruvbox Dark", vim.log.levels.INFO)
      end, desc = "Switch to Gruvbox Dark" },
      
      { "<leader>cgl", function()
        vim.o.background = "light"
        vim.cmd("colorscheme gruvbox")
        vim.notify("Switched to Gruvbox Light", vim.log.levels.INFO)
      end, desc = "Switch to Gruvbox Light" },
    },
    config = function()
      -- Set default colorscheme
      vim.cmd("colorscheme monokai-pro")
    end,
  },
}
