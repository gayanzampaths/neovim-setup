return {
  -- Git commands in vim
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status" },
      { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git Diff" },
      { "<leader>gp", "<cmd>Git push<cr>", desc = "Git Push" },
      { "<leader>gl", "<cmd>Git pull<cr>", desc = "Git Pull" },
    },
  },
  
  -- Git blame
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.g.gitblame_enabled = 0 -- Disabled by default
      vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle Git Blame" })
    end,
  },
  
  -- Diffview
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diff View" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
    },
  },
  
  -- Git conflict resolution
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },
}
