require('telescope').setup({
  defaults = {
    layout_strategy = "flex",
    layout_config = {
      flip_columns = 140,
      horizontal = {
        width = 0.9,
        height = 0.6,
      },
      vertical = {
        width = 0.9,
        height = 0.9,
        preview_height = .7,
      },
    }
  }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('v', '<leader>fs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

vim.keymap.set('n', 'gr', builtin.lsp_references, {})

