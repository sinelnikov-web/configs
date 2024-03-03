return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        integrations = {
          indent_blankline = {
            enabled = true,
          },
        }
      })
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  }
}
