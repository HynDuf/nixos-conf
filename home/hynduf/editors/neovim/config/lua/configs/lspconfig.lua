local M = {}

M.defaults = function()
  require("nvchad.configs.lspconfig").defaults()

  vim.lsp.config("*", {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    on_init = M.on_init,
  })

  -- LUA
  vim.lsp.config("lua_ls", {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
            [vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
            [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  })

  -- C / C++
  vim.lsp.config("clangd", {
    cmd = {
      "clangd",
      "--header-insertion=never",
    },
  })

  -- PYTHON
  vim.lsp.config("pyright", {
    settings = {
      pyright = {
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          ignore = { "*" },
        },
      },
    },
  })

  -- TYPST
  vim.lsp.config("tinymist", {
    settings = {
      formatterMode = "typstfmt",
      formatterPrintWidth = 90,
    },
  })

  -- ===================================================================
  -- Enable all servers
  -- ===================================================================

  local servers = {
    "ruff",
    "html",
    "cssls",
    "vtsls",
    "gopls",
    "bashls",
    "lua_ls",
    "clangd",
    "pyright",
    "tinymist",
  }

  vim.lsp.enable(servers)
end

return M
