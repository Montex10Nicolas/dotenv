require'nvim-lsp-installer'.setup{
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}
local defaultKeymap = function()
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
	vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer = 0})
end

require'lspconfig'.gopls.setup{
	on_attach = defaultKeymap,
}
require'lspconfig'.sumneko_lua.setup{
	on_attach = defaultKeymap,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}
require'lspconfig'.tailwindcss.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.prismals.setup{}
require'lspconfig'.cssmodules_ls.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.marksman.setup{}
require'lspconfig'.golangci_lint_ls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.graphql.setup{}
require'lspconfig'.tsserver.setup{}
