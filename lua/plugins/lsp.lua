return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
    },
    config = function()
      require("neodev").setup()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "jdtls",
          "gopls",
          "kotlin_language_server",
          "rust_analyzer",
          "ts_ls",
          "eslint",
          "lua_ls",
        },
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Keymaps for LSP
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "Goto Definition")
          map("gr", vim.lsp.buf.references, "Goto References")
          map("gI", vim.lsp.buf.implementation, "Goto Implementation")
          map("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
          map("<leader>ds", vim.lsp.buf.document_symbol, "Document Symbols")
          map("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gD", vim.lsp.buf.declaration, "Goto Declaration")
        end,
      })

      -- Go
      lspconfig.gopls.setup({
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })

      -- Kotlin
      lspconfig.kotlin_language_server.setup({
        capabilities = capabilities,
      })

      -- Rust
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      })

      -- TypeScript
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      -- ESLint
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })

      -- Lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
  },
}
