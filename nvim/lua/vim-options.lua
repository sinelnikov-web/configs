vim.cmd("set mouse=a")
vim.cmd("set encoding=utf-8")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set numberwidth=6")
vim.cmd("set noswapfile")
vim.cmd("set scrolloff=8")
vim.cmd("set sidescrolloff=5")
vim.cmd("set autoread")
vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI'}, {
  pattern = '*',
  command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif",
})
vim.api.nvim_create_autocmd({'FileChangedShellPost'}, {
  pattern = '*',
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
})
vim.opt.clipboard = "unnamedplus"

vim.cmd("set tabstop=4")
vim.cmd("set nowrap")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set autoindent")
vim.cmd("set fileformat=unix")
vim.cmd("filetype indent on")

vim.cmd("set smartindent")
vim.cmd("set tabstop=2")
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=2")

vim.cmd("set splitbelow")
vim.g.mapleader = " "
vim.keymap.set('n', '<C-s>', ":w<CR>", {})
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('n', '<C-w><', "5<C-w><")
vim.keymap.set('n', '<C-w>>', "5<C-w>>")
vim.keymap.set('n', '<C-w>+', "5<C-w>+")
vim.keymap.set('n', '<C-w>-', "5<C-w>-")
