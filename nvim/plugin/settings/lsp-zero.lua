local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.configure('clojure-lsp', {
  on_attach = function(client, bufnr)
    print('hello clojure-lsp')
  end
})
lsp.nvim_workspace()

lsp.setup({
    root_dir = require('lspconfig.util').root_pattern({'.git'})
})

vim.diagnostic.config({ virtual_text = true })
