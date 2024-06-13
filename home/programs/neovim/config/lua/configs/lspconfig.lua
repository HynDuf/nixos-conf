-- local configs = require 'nvchad.configs.lspconfig'
local map = vim.keymap.set
local M = {}
local conf = { signature = true }

-- export on_attach & capabilities
M.on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = desc }
  end
  if client.name == 'ruff' then
    client.server_capabilities.hoverProvider = false
  end

  map('n', 'gD', vim.lsp.buf.declaration, opts 'Lsp Go to declaration')
  map('n', 'gd', vim.lsp.buf.definition, opts 'Lsp Go to definition')
  map('n', 'gK', vim.lsp.buf.hover, opts 'Lsp hover information')
  map('n', 'gi', vim.lsp.buf.implementation, opts 'Lsp Go to implementation')
  map('n', '<leader>sh', vim.lsp.buf.signature_help, opts 'Lsp Show signature help')
  map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts 'Lsp Add workspace folder')
  map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts 'Lsp Remove workspace folder')

  map('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts 'Lsp List workspace folders')

  map('n', '<leader>D', vim.lsp.buf.type_definition, opts 'Lsp Go to type definition')

  map('n', '<leader>ra', function()
    require 'nvchad.lsp.renamer'()
  end, opts 'Lsp NvRenamer')

  map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts 'Lsp Code action')
  map('n', 'gr', vim.lsp.buf.references, opts 'Lsp Show references')

  -- setup signature popup
  if conf.signature and client.server_capabilities.signatureHelpProvider then
    require('nvchad.lsp.signature').setup(client, bufnr)
  end
end

-- disable semanticTokens
M.on_init = function(client, _)
  if client.supports_method 'textDocument/semanticTokens' then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { 'markdown', 'plaintext' },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  },
}

M.defaults = function()
  dofile(vim.g.base46_cache .. 'lsp')
  require 'nvchad.lsp'

  require('lspconfig').lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    on_init = M.on_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = {
            [vim.fn.expand '$VIMRUNTIME/lua'] = true,
            [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
            [vim.fn.stdpath 'data' .. '/lazy/ui/nvchad_types'] = true,
            [vim.fn.stdpath 'data' .. '/lazy/lazy.nvim/lua/lazy'] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }
end

-- local on_attach = configs.on_attach
local on_init = M.on_init
local capabilities = M.capabilities

local on_attach = M.on_attach

-- local function my_attach(client, bufnr)
--   local function opts(desc)
--     return { buffer = bufnr, desc = desc }
--   end
--   configs.on_attach(client, bufnr)
--   map('n', 'gK', vim.lsp.buf.hover, opts 'Lsp hover information')
--   map({ 'n', 'v' }, 'K', '<C-u>')
-- end

local lspconfig = require 'lspconfig'
local servers = { 'ruff', 'html', 'cssls', 'tsserver', 'clangd', 'zls', 'astro' }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.verible.setup {
  on_attach = on_attach,
  root_dir = function()
    return vim.loop.cwd() -- fixes git problem with verible
  end,
  cmd = { 'verible-verilog-ls', '--rules_config_search' },
  -- cmd = { 'verible-verilog-ls' },
  filetypes = { 'verilog', 'systemverilog' },
}
--
-- lspconfig.ruff_lsp.setup {
--   on_attach()
--   -- init_options {
--   --   settings = {
--   --     args = {},
--   --   },
--   -- },
-- }
-- lspconfig['svlangserver'].setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   filetypes = { 'verilog', 'systemverilog' },
-- }
--
lspconfig.texlab.setup {
  texlab = {
    build = {
      executable = 'tectonic',
      args = {
        '-X',
        'compile',
        '%f',
        '--synctex',
        '--keep-logs',
        '--keep-intermediates',
      },
      onSave = true,
      forwardSearchAfter = false,
    },
    -- auxDirectory = 'build',
    -- forwardSearch = {
    --   executable = nil,
    --   args = {},
    -- },
    -- chktex = {
    --   onOpenAndSave = false,
    --   onEdit = false,
    -- },
    -- diagnosticsDelay = 300,
    latexFormatter = 'latexindent',
    -- latexindent = {
    --   ['local'] = nil, -- local is a reserved keyword
    --   modifyLineBreaks = false,
    -- },
    -- bibtexFormatter = 'texlab',
    -- formatterLineLength = 80,
  },
}

lspconfig.pyright.setup {
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { '*' },
      },
    },
  },
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
-- Enable completion triggered by <c-x><c-o>
-- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

-- Buffer local mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
-- local opts = { buffer = ev.buf }
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
-- vim.keymap.set('n', '<space>wl', function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, opts)
-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
-- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- vim.keymap.set('n', '<space>f', function()
--   vim.lsp.buf.format { async = true }
-- end, opts)
-- end,
-- })

return M
