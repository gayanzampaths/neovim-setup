return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "java",
        "go",
        "kotlin",
        "rust",
        "typescript",
        "javascript",
        "tsx",
        "json",
        "yaml",
        "html",
        "css",
        "markdown",
        "lua",
        "vim",
        "vimdoc",
      },
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
    })
  end,
}
