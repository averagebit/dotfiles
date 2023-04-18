local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md
null_ls.setup({
	debug = false,
	sources = {
		diagnostics.golangci_lint,
		-- diagnostics.rust_analyzer,
		formatting.nixfmt,
		formatting.rustfmt,
		formatting.gofmt,
		formatting.goimports,
		formatting.terraform_fmt.with({
			extra_filetypes = { "hcl" },
		}),
		formatting.prettierd.with({
			extra_filetypes = { "svelte", "astro" },
		}),
		formatting.stylua,
	},
	on_attach = function(client, buf)
		-- you can reuse a shared lspconfig on_attach callback here
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = buf })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = buf })
				end,
			})
		end
	end,
})
