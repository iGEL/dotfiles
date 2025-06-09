local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").clojure_lsp.setup({
  capabilities = capabilities,
  cmd = { "clojure-lsp" }, -- fallback to mason path if installed via mason
  on_attach = function(client, bufnr)
    -- custom keymaps or config
  end,
  settings = {
    clojure = {
    },
  },
})
