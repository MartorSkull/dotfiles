local langs = {
  'bash',
  'c',
  'dart',
  'git',
  'javascript',
  'lua',
  'python',
  'query',
  'rust',
  'vim',
  'vimdoc',
}

require('nvim-treesitter').install(langs)

vim.api.nvim_create_autocmd('FileType', {
  pattern = langs,
  callback = function() vim.treesitter.start() end,
})

