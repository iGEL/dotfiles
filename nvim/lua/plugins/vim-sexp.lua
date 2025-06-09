-- Lifted from https://github.com/tpope/vim-sexp-mappings-for-regular-people/blob/7c3de2f13422fb4b62b4c34a660532c7b3d240c7/plugin/sexp_mappings_for_me.vim

return {
  "guns/vim-sexp",
  config = function()
    -- Set default filetypes for vim-sexp mappings
    local filetypes = vim.g.sexp_filetypes or "lisp,scheme,clojure"
    local patterns = vim.split(filetypes, ",")

    vim.api.nvim_create_autocmd("FileType", {
      pattern = patterns,
      callback = function()
        -- Only proceed if vim-sexp is fully loaded
        if not vim.g.sexp_loaded then return end

        local opts = { noremap = true, silent = true, buffer = true }
        local map = vim.keymap.set

        -- Custom mappings
        map("n", "<localleader>kB", "<Plug>(sexp_emit_head_element)", opts)
        map("n", "<localleader>kb", "<Plug>(sexp_emit_tail_element)", opts)
        map("n", "<localleader>kS", "<Plug>(sexp_capture_prev_element)", opts)
        map("n", "<localleader>ks", "<Plug>(sexp_capture_next_element)", opts)
        map("n", "<localleader>kr", "<Plug>(sexp_raise_element)", opts)
      end,
    })
  end,
}
