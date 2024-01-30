local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'pylsp', 'rust_analyzer', 'clangd', 'omnisharp'},
  handlers = {
    lsp_zero.default_setup,
  }
})

require('cmp').setup({
  formatting = lsp_zero.cmp_format(),
})

require("lspconfig").omnisharp.setup({})
