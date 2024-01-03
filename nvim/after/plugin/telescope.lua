local builtin = require('telescope.builtin')
--vim.api.nvim_set_keymap('n', '<Leader>pf', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>pf', "<cmd>lua require'telescope.builtin'.find_files({find_command = {'rg', '--files', '--hidden', '-g', '!.git' }, hidden = true, no_ignore = true, no_ignore_parent = true })<cr>", {noremap = true, silent = true})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
