return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = "deepseek",
    -- provider = "deepseek",
    -- deepseek = {
    --   endpoint = "https://api.deepseek.com/v1",
    --   model = "deepseek-chat",
    --   api_key_name = "DEEPSEEK_API_KEY",
    -- },
    -- vendors = {
    --   deepseek = {
    --     __inherited_from = "openai",
    --     api_key_name = "DEEPSEEK_API_KEY",
    --     endpoint = "https://api.deepseek.com/v1",
    --     model = "deepseek-chat",
    --   },
    --   --
    --   -- provider = "copilot",
    --   -- auto_suggestions_provider = "copilot",
    --   -- copilot = {
    --   --   model = "claude-3.7-sonnet",
    --   -- },
    --   -- openai = {
    --   --   endpoint = "https://api.githubcopilot.com",
    --   --   model = "", -- your desired model (or use gpt-4o, etc.)
    --   --   timeout = 30000, -- timeout in milliseconds
    --   --   temperature = 0, -- adjust if needed
    --   --   max_tokens = 4096,
    --   --   -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
    --   -- },
    -- },
    auto_suggestions_provider = nil,
    cursor_applying_provider = "groq",
    -- provider = "copilot",
    copilot = {
      model = "claude-3.7-sonnet",
      timeout = 30000, -- timeout in milliseconds
      temperature = 0, -- adjust if needed
      max_tokens = 8196,
    },
    -- deepseek = {
    --   __inherited_from = "openai",
    --   model = "deepseek-chat",
    --   api_key_name = "DEEPSEEK_API_KEY",
    --   endpoint = "https://api.deepseek.com/v1",
    -- },
    behaviour = {
      enable_cursor_planning_mode = true,
    },
    vendors = {

      deepseek = {
        __inherited_from = "openai",
        api_key_name = "DEEPSEEK_API_KEY",
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-chat",
      },
      groq = {
        __inherited_from = "openai",
        api_key_name = "GROQ_API_KEY",
        endpoint = "https://api.groq.com/openai/v1/",
        model = "llama-3.3-70b-versatile",
        max_completion_tokens = 32768,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- --- The below dependencies are optional,
      --- "echasnovski/mini.pick", -- for file_selector provider mini.pick
      --- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      --- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      --- "ibhagwan/fzf-lua", -- for file_selector provider fzf
      --- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      --- "zbirenbaum/copilot.lua", -- for providers='copilot'
      --- {
      ---   -- support for image pasting
      ---   "HakonHarnes/img-clip.nvim",
      ---   event = "VeryLazy",
      ---   opts = {
      ---     -- recommended settings
      ---     default = {
      ---       embed_image_as_base64 = false,
      ---       prompt_for_file_name = false,
      ---       drag_and_drop = {
      ---         insert_mode = true,
      ---       },
      ---       -- required for Windows users
      ---       use_absolute_path = true,
      ---     },
      ---   },
      --- },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
