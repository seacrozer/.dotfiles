require('plugins')
require('station')
 
--[[ require('kanagawa-paper').setup({
  undercurl = true,
  transparent = false,
  gutter = false,
  dimInactive = true, -- disabled when transparent
  terminalColors = true,
  commentStyle = { italic = true },
  functionStyle = { italic = false },
  keywordStyle = { italic = false, bold = false },
  statementStyle = { italic = false, bold = false },
  typeStyle = { italic = false },
  colors = { theme = {}, palette = {} }, -- override default palette and theme colors
  overrides = function()  -- override highlight groups
    return {}
  end,
}) --]]

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

-- THEMES
-- vim.o.background = 'dark'
vim.cmd.colorscheme 'melange'
-- vim.cmd.colorscheme 'kanagawa-wave'
-- vim.cmd.colorscheme 'kanagawa-paper'
-- vim.cmd("colorscheme cyberdream")
--vim.cmd("colorscheme wildcharm")
-- vim.cmd("colorscheme retrobox")
-- vim.cmd([[colorscheme gruvbox]])
vim.cmd.colorscheme("gruber-darker")


vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- Telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-- Indent setup

require("ibl").setup {
    scope = { enabled = false },
}

