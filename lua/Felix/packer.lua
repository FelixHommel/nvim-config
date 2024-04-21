vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	--Package manager Packer
    use("wbthomason/packer.nvim")

    --Telescope
    use ({
		"nvim-telescope/telescope.nvim", tag = "0.1.x",
		requires = {
            "nvim-lua/plenary.nvim"
        }
	})

    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    })

    use ("nvim-telescope/telescope-ui-select.nvim")

    --Colorschemes
	use("loctvl842/monokai-pro.nvim")
    use("sainnhe/gruvbox-material")

    --Treesitter
	use("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"})
	use("nvim-treesitter/playground")

    --Harpoon
    use("theprimeagen/harpoon")

    --Undotree
    use("mbbill/undotree")

    --Git
    use("tpope/vim-fugitive")

    --LSP
	use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")

    --Code Completion
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        }
    })

    use("onsails/lspkind.nvim")

    --Java
	use({
        "mfussenegger/nvim-jdtls",
        requires = {
            "mfussenegger/nvim-dap",
            "rcarriga/cmp-dap",
        }
    })

    --Error List
    use({
        "folke/trouble.nvim"
    })

    --Colorcolumn
    use("m4xshen/smartcolumn.nvim")

    --Statusbar
    use("nvim-lualine/lualine.nvim")
    use("lewis6991/gitsigns.nvim")

    --Advanced Icons
    use("nvim-tree/nvim-web-devicons")

    --Tabbar
    use({
        "nanozuki/tabby.nvim",
        requires = {
        "nvim-tree/nvim-web-devicons",
        }
    })

    use({
        "LukasPietzschmann/telescope-tabs",
        requires = {"nvim-telescope/telescope.nvim"}
    })

    --Cursor underline
    use("sontungexpt/stcursorword")

    --Intern Console
    use("akinsho/toggleterm.nvim")

   --Scope identifier
    use("lukas-reineke/indent-blankline.nvim")

end)
