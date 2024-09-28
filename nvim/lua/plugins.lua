-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- Themes
    use "savq/melange-nvim"
    use "scottmckendry/cyberdream.nvim"
    use "ellisonleao/gruvbox.nvim"
    use "maxmx03/solarized.nvim"
    use "navarasu/onedark.nvim"
    use "sho-87/kanagawa-paper.nvim"
    use "rebelot/kanagawa.nvim"
    use "blazkowolf/gruber-darker.nvim"

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- Lsp
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {

        {'neovim/nvim-lspconfig'},
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
        }
    }

    -- Telescope
    use {
          'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
          requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Auto pairs
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    -- Indent
    use "lukas-reineke/indent-blankline.nvim"

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Neo-tree ( File system )
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }


    -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
    use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
    use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
    use 'romgrk/barbar.nvim'
end)

