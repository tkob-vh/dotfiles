return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    provider = "copilot",
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      "zbirenbaum/copilot.lua",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = true },
          panel = { enabled = true },
          copilot_node_command = "node", -- Node.js 的路径
          server_opts_overrides = {
            trace = "verbose", -- 打开调试日志
            settings = {
              advanced = {
                inlineSuggestCount = 3, -- 自定义建议数量
              },
            },
          },
        })
      end,
    },
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        provider = "copilot",
        default = {
          copilot = {
            endpoint = "https://api.githubcopilot.com",
            model = "gpt-4o-2024-05-13",
            proxy = "socks5://127.0.0.1:20170",
            allow_insecure = false,
            timeout = 30000,
            temperature = 0,
            max_tokens = 4096,
          },
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
