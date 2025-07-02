return { 
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night", -- night, storm, day, moon
      transparent = false,
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}
