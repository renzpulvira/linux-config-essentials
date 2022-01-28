function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end


nmap('<C-j><C-w>', 'j');
nmap('<C-k><C-w>', 'k');
nmap('<C-h><C-w>', 'h');
nmap('<C-l><C-w>', 'l');

nmap('<space>w', ':<C-u>w<Cr>');
nmap('<space>q', ':<C-u>q<Cr>');

nmap('<space><space>r', ':<C-u>CocRestart<Cr>');
nmap('<space>n', ':<C-u>nohl<Cr>');
nmap('<space>t', ':<C-u>NERDTreeFocus<Cr>');

nmap('<space>1', '1gt<CR>');
nmap('<space>2', '2gt<CR>');
nmap('<space>3', '3gt<CR>');
nmap('<space>4', '4gt<CR>');
nmap('<space>5', '5gt<CR>');
nmap('<space>6', '6gt<CR>');
nmap('<space>7', '7gt<CR>');
nmap('<space>8', '8gt<CR>');
nmap('<space>9', '9gt<CR>');
nmap('<leader>0', ':tablast<CR>');

nmap('H','gT');
nmap('L','gt');