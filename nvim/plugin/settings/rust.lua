-- vim.api.nvim_create_augroup("RustAutoFmt", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = "RustAutoFmt",
--   pattern = "*.rs",
--   command = "silent! !cargo fmt"
-- })


vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format {async = false, id = args.data.client_id }
      end,
    })
  end
})
