return {
  "olimorris/codecompanion.nvim",
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  opts = function(_, opts)
    -- Change this one variable to switch between adapters
    local selected_adapter = "copilotclaude" -- Can be "copilotclaude", "claudeapi", "deepseek", "gemini", "gpt", etc.

    -- Define all adapters configuration
    local adapters_config = {
      copilotclaude = function()
        return require("codecompanion.adapters").extend("copilot", {
          name = "copilotclaude",
          schema = {
            model = {
              default = "claude-3.7-sonnet",
            },
          },
        })
      end,

      copilotgpt = function()
        return require("codecompanion.adapters").extend("copilot", {
          name = "copilotgpt",
          schema = {
            model = {
              default = "gpt-4.1",
            },
          },
        })
      end,
      deepseek = function()
        return require("codecompanion.adapters").extend("deepseek", {
          schema = {
            model = {
              default = "deepseek-chat",
            },
            temperature = {
              default = 0,
            },
          },
        })
      end,
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          schema = {
            model = {
              default = "gemini-2.5-pro-exp-03-25",
            },
          },
        })
      end,

      -- Add configurations for other adapters here
      -- claudeapi = function() ... end,
      -- gemini = function() ... end,
      -- gpt = function() ... end,
    }

    -- Set the selected adapter
    opts.adapters = {
      [selected_adapter] = adapters_config[selected_adapter],
    }

    -- Set strategies based on selected adapter
    opts.strategies = {
      chat = {
        adapter = selected_adapter,
        tools = tools,
      },
      inline = {
        adapter = selected_adapter == "copilotclaude" and "copilot" or selected_adapter,
      },
      agent = {
        adapter = selected_adapter,
      },
    }

    opts.display = {
      chat = {
        show_settings = "true",
      },
    }
  end,
}
