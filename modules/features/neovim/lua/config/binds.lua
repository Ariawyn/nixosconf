vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Keymap function for cleanliness
function Keymap(mode, key, binding, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, key, binding, options)
end

-- Basic keymaps
Keymap("i", "<C-BS>", "<C-W>") -- Ctrl-Backspace deletes whole words

Keymap("i", "<C-c>", "<Esc>") -- Ctrl-c to escape insert
Keymap("n", "<C-c>", ":nohl<CR>") -- Clear highlights from search
