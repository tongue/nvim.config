-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- Keep cursor 8 lines from top/bottom

function SearchFor()
  local input_string = vim.fn.input 'Search For > '
  if input_string == '' then
    return
  end
  require('telescope.builtin').grep_string {
    search = input_string,
  }
end

vim.o.scrolloff = 8
vim.o.tabstop = 2
vim.o.relativenumber = true
vim.o.hlsearch = true
vim.opt.swapfile = false
vim.o.wrap = false

vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = '[W]rite Buffer' })
vim.keymap.set('n', '<leader>ss', SearchFor, { desc = '[S]tring [S]earch' })
vim.keymap.set('n', ']q', '<cmd>cnext<CR>', { desc = '[Q]uickfix Next' })
vim.keymap.set('n', '[q', '<cmd>cprev<CR>', { desc = '[Q]uickfix Previous' })

vim.diagnostic.config { virtual_text = false }
local signs = { Error = '', Warn = '', Hint = '󰌶', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

return {
  'mattn/emmet-vim',
  'nvim-treesitter/nvim-treesitter-context'
}
