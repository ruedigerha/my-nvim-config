local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Colorschemes
    use 'EdenEast/nightfox.nvim'
    --use 'RRethy/nvim-base16'
    --use 'shaunsingh/nord.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'RRethy/vim-illuminate'
    use({
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
        require("lsp_lines").setup()
      end,
    })

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'LinArcX/telescope-env.nvim'
    use 'nvim-telescope/telescope-ui-select.nvim'

    -- Neo-Tree
    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = { 
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }
    use {
      "mrbjarksen/neo-tree-diagnostics.nvim",
      requires = "nvim-neo-tree/neo-tree.nvim",
      module = "neo-tree.sources.diagnostics",
    }

    -- git
    use 'lewis6991/gitsigns.nvim'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    -- Movement
    use {
      'phaazon/hop.nvim',
      branch = 'v2' -- optional but strongly recommended
    }

    if packer_bootstrap then
      require('packer').sync()
    end
  end)
