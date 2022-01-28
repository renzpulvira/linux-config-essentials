local set = vim.opt
vim.g.mapleader="<space>"
set.nu=true
set.rnu=true
set.tabstop=2
set.shiftwidth=2
set.smarttab=true
set.softtabstop=2
set.mouse="a"
set.linespace=5
set.expandtab=true
set.signcolumn="yes"
set.background="dark"
set.backspace="indent,eol,start"
set.laststatus=2
set.incsearch=true
set.hlsearch=true
set.encoding="utf-8"
set.splitbelow=true
set.splitright=true
set.cmdheight=2
set.cursorline=true
set.termguicolors=true


vim.cmd[[
set statusline=%f\ \ %y%m%r%h%w%=[%l,%v]\ \ \ \ \ \ [%L,%p%%]\ %n
]]