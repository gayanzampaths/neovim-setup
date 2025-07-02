-- ~/.config/nvim/ftplugin/java.lua
local config = {
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
    },
  },
  init_options = {
    bundles = {},
  },
}

require("jdtls").start_or_attach(config)

-- Java-specific keymaps
vim.keymap.set("n", "<leader>jo", "<cmd>lua require'jdtls'.organize_imports()<cr>", { desc = "Organize Imports" })
vim.keymap.set("n", "<leader>jv", "<cmd>lua require'jdtls'.extract_variable()<cr>", { desc = "Extract Variable" })
vim.keymap.set("n", "<leader>jc", "<cmd>lua require'jdtls'.extract_constant()<cr>", { desc = "Extract Constant" })
vim.keymap.set("n", "<leader>jm", "<cmd>lua require'jdtls'.extract_method()<cr>", { desc = "Extract Method" })
