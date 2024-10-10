return {
  'mhartington/formatter.nvim',
  config = function()
    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    local formatter = require 'formatter'
    formatter.setup {
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
          require('formatter.filetypes.lua').stylua,
        },
        html = {
          require('formatter.filetypes.html').prettier,
        },
        svelte = {
          require('formatter.filetypes.svelte').prettier,
        },
        javascript = {
          require('formatter.filetypes.javascript').prettier,
        },
        typescript = {
          require('formatter.filetypes.typescript').prettier,
        },
        typescriptreact = {
          require('formatter.filetypes.typescriptreact').prettier,
        },
        json = {
          require('formatter.filetypes.json').prettier,
        },
        css = {
          require('formatter.filetypes.css').prettier,
        },
        markdown = {
          require('formatter.filetypes.markdown').prettier,
        },
        rust = {
          require('formatter.filetypes.rust').rustfmt,
        },
        go = {
          require('formatter.filetypes.go').gofmt,
        },
        templ = {
          vim.lsp.buf.format()
        },
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        -- ['*'] = {
          -- "formatter.filetypes.any" defines default configurations for any
          -- filetype
          -- require('formatter.filetypes.any').remove_trailing_whitespace,
        -- },
      },
    }
    vim.keymap.set('n', '<leader>f', ':FormatWrite<cr>', { desc = 'Format buffer' })
  end,
}
