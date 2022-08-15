vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set('n', '<Space>', 'Nop')
keymap.set('n', 'x', '"_x')
keymap.set('n', '<leader>a', 'gg<S-v>G')
