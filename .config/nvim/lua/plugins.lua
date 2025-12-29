vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Visual
    use 'phanviet/vim-monokai-pro'
    use 'vim-airline/vim-airline'
    use 'nvim-treesitter/nvim-treesitter'

    -- Management
    use 'williamboman/mason.nvim'    
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig' 

    -- Completion
    use 'hrsh7th/nvim-cmp'
    -- use 'sirver/UltiSnips'
    use 'honza/vim-snippets'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
    use "rafamadriz/friendly-snippets"

    -- Languages
    use 'mrcjkb/rustaceanvim'
    use 'rust-lang/rust.vim'
    use 'mrcjkb/haskell-tools.nvim'

    -- Misc
    use 'mileszs/ack.vim'
    use 'lotabout/skim.vim'
    use 'tpope/vim-fugitive'
end)
