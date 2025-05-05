return {

    -- Alpha (Dashboard)
    -- Added this plugin to initial configuration
    {
        "goolord/alpha-nvim",
        lazy = false, -- Ensure it loads on startup
        config = function()
            require("custom.alpha-config") -- Load the configuration from alpha-config.lua
        end,
    },

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
    },

    -- Colorscheme
    {
        'folke/tokyonight.nvim',
    },

    -- Hop (Better Navigation)
    {
        "phaazon/hop.nvim",
        lazy = true,
    },

    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
    },

    -- Nvimtree (File Explorer)
    {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },

    -- Telescope (Fuzzy Finder)
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        dependencies = {
            {'nvim-lua/plenary.nvim'},
        }
    },

    -- Which-key
    {
        'folke/which-key.nvim',
        lazy = true,
    },

}