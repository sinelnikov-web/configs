return {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup({

    })

    vim.keymap.set('n', '<leader>f', ':HopChar1<CR>')
  end
}
