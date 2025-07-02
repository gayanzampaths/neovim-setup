return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap
    -- File pickers
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })
    
    -- Git pickers
    keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
    keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
    keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Git branches" })
    
    -- LSP pickers
    keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP references" })
    keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", { desc = "LSP definitions" })
    keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<cr>", { desc = "LSP implementations" })
    keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "LSP type definitions" })
    
    -- Other pickers
    keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
    keymap.set("n", "<leader>sc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
    keymap.set("n", "<leader>sm", "<cmd>Telescope marks<cr>", { desc = "Marks" })
    keymap.set("n", "<leader>sr", "<cmd>Telescope registers<cr>", { desc = "Registers" })
    keymap.set("n", "<leader>ss", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme" })
  end,
}
