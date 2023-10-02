local lsp = require('lsp-zero').preset({
	manage_nvim_cmp = {
		set_extra_mappings=true,
	}
})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

require'lspconfig'.rust_analyzer.setup{
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = false;
			}
		},
	}
}

require'lspconfig'.pyright.setup{}
require'lspconfig'.phpactor.setup{}

local cmp = require('cmp')

cmp.setup({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({select = false}),
	},
	sources = {
		{name = 'nvim_lsp'},
		{name = 'nvim_lua'},
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	}
})

