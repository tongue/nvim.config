-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- Keep cursor 8 lines from top/bottom

vim.o.scrolloff = 8
vim.o.tabstop = 2
vim.o.relativenumber = true
vim.o.hlsearch = true
vim.opt.swapfile = false

vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = '[W]rite Buffer' })

return {
  'mattn/emmet-vim',
}
