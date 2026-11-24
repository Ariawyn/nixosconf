vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim", name = "tokyonight" },
	{ src = "https://github.com/tadaa/vimade", name = "vimade" },
})

require("tokyonight").setup({
	style = "night",
	transparent = true,
	on_colors = function(colors)
		colors.hint = colors.orange
		colors.error = "#ff0000"
	end,
	on_highlights = function(highlights, colors) end,
})

require("vimade").setup({
	recipe = { "minimalist", { animate = true } },
	fadelevel = 0.8,
})
