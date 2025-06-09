return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("telescope").setup({})
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>t', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find Symbols" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find Old Files" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under Cursor" })
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Search Git Commits" })
    vim.keymap.set("n", "<leader>gb", builtin.git_bcommits, { desc = "Search Git Commits for Buffer" })
  end
}
