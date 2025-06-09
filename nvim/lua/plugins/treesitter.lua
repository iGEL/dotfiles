return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all"
      ensure_installed = { "clojure" },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
      indent = {
        enable = true
      }
    }
  end
}
