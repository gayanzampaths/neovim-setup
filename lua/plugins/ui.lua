return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight", -- Changed from catppuccin to tokyonight
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "dashboard", "alpha", "starter" },
          },
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { "nvim-tree", "toggleterm" },
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 35,
        },
      })
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
            },
          },
        },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        exclude = {
          filetypes = {
            "help",
            "startify",
            "dashboard",
            "lazy",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "text",
          },
          buftypes = {
            "terminal",
            "nofile",
          },
        },
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Command palette / UI for commands
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      -- Document existing key chains
      wk.add({
        { "<leader>c", group = "Code" },
        { "<leader>d", group = "Debug/Dashboard" },
        { "<leader>f", group = "Find/File" },
        { "<leader>g", group = "Git" },
        { "<leader>j", group = "Java" },
        { "<leader>l", group = "LSP/Lazy" },
        { "<leader>r", group = "Rename" },
        { "<leader>s", group = "Search" },
        { "<leader>t", group = "Test/Terminal" },
        { "<leader>w", group = "Window/Session" },
        { "<leader>x", group = "Diagnostics/Quickfix" },
      })
    end,
  },

  -- Better UI for messages, cmdline and popupmenu
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = true,
          lsp_doc_border = true,
        },
      })
    end,
  },

  -- UI for notifications
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        render = "compact",
        stages = "fade",
      })
      vim.notify = require("notify")
    end,
  },

  -- Improved UI for input and select
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
      require("dressing").setup({
        input = {
          enabled = true,
          default_prompt = "Input:",
          win_options = {
            winblend = 0,
          },
        },
        select = {
          enabled = true,
          backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
        },
      })
    end,
  },

  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup({
        theme = "doom",
        config = {
          header = {
            "",
            "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
            "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
            "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
            "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
            "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
            "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
            "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
            " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
            " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
            "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
            "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
            "",
          },
          center = {
            {
              icon = " ",
              icon_hl = "Title",
              desc = "Find File",
              desc_hl = "String",
              key = "f",
              keymap = "SPC f f",
              key_hl = "Number",
              action = "Telescope find_files",
            },
            {
              icon = " ",
              desc = "New File",
              key = "n",
              keymap = "SPC f n",
              action = "ene | startinsert",
            },
            {
              icon = " ",
              desc = "Recent Files",
              key = "r",
              keymap = "SPC f r",
              action = "Telescope oldfiles",
            },
            {
              icon = " ",
              desc = "Find Text",
              key = "g",
              keymap = "SPC f g",
              action = "Telescope live_grep",
            },
            {
              icon = " ",
              desc = "Config",
              key = "c",
              keymap = "SPC f c",
              action = "edit ~/.config/nvim/init.lua",
            },
            {
              icon = " ",
              desc = "Lazy",
              key = "l",
              keymap = "SPC l",
              action = "Lazy",
            },
            {
              icon = " ",
              desc = "Quit",
              key = "q",
              keymap = "SPC q",
              action = "qa",
            },
          },
          footer = {},
        },
      })
    end,
  },

  -- Floating terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        direction = "float",
        float_opts = {
          border = "curved",
        },
      })
    end,
  },

  -- Better quickfix window
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
      })
    end,
  },

  -- LSP progress
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
}
