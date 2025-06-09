return {
  "calind/selenized.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme selenized]])

    -- Set selection background color:
    if vim.o.background == 'light' then
      vim.api.nvim_set_hl(0, "Visual", { bg = '#cfcebe' })
    else
      vim.api.nvim_set_hl(0, "Visual", { bg = '#325b66' })
    end
  end,
}
