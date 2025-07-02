return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rcasia/neotest-java",
    "nvim-neotest/neotest-go",
    "rouge8/neotest-rust",
    "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-java"),
        require("neotest-go"),
        require("neotest-rust"),
        require("neotest-jest"),
        require("neotest-vitest"),
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run() end, { desc = "Run Test" })
    vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,
      { desc = "Run File" })
    vim.keymap.set("n", "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,
      { desc = "Debug Test" })
    vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle Summary" })
  end,
}
