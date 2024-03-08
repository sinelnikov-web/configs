return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  config = function()
    vim.cmd [[
      function OpenMarkdownPreview (url)
        execute "silent ! tmux split-window -h \"browsh --startup-url " . a:url . "\""
      endfunction
      let g:mkdp_browserfunc = 'OpenMarkdownPreview'
    ]]
  end,
}
