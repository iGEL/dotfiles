-- Format-on-save setup
local on_attach = function(_, bufnr)
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

-- Optional: capabilities for nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure clojure-lsp
vim.lsp.config("clojure_lsp", {
  cmd = { "clojure-lsp" },
  root_markers = { "project.clj", "deps.edn", "build.boot", ".git" },
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Enable clojure-lsp
vim.lsp.enable("clojure_lsp")
