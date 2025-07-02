local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Language-specific settings
autocmd("FileType", {
  pattern = { "java", "kotlin" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

autocmd("FileType", {
  pattern = { "go" },
  callback = function()
    vim.opt_local.expandtab = false
  end,
})
