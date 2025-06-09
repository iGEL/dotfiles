return {
  "github/copilot.vim",
  event = "InsertEnter", -- or "VeryLazy" if you want it more delayed
  config = function()
    -- Disable Copilot's built-in completion
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_enabled = false -- prevents it from inserting suggestions

  end,
}
