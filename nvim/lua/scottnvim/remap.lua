vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-d>", vim.cmd.NvimTreeToggle)

-- scrolling 
vim.keymap.set({"n", "v", "i"}, "<C-j>", "<C-d>")
vim.keymap.set({"n", "v", "i"}, "<C-k>", "<C-u>")

-- move selection and indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })

vim.api.nvim_create_user_command("CCSet", function(args)
    vim.opt.colorcolumn = args['args']
end, { desc = "toggle colorcolumn", nargs = '*' })


vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
