require('nvim-treesitter.configs').setup({
  ensure_installed = { "rust", "python", "javascript", "bash", "c", "lua", "vim", "vimdoc", "query" },
  sync_install = false,

  auto_install = true,
  ignore_install = {},

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  italic = {
    enable = false,
  },

  modules = {},
})

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
