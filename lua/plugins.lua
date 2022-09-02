local packer = require("packer")
packer.startup(function(use)
    -- Packer 可以管理自己本身
    use("wbthomason/packer.nvim")
    -- 你的插件列表...
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- bufferline
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
    -- lualine
    -- use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    -- use("arkav/lualine-lsp-progress")
    -- windline
    use("windwp/windline.nvim")
    -- telescope
    use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
    -- telescope extensions
    use("LinArcX/telescope-env.nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- dashboard-nvim
    use({ "glepnir/dashboard-nvim" })
    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    --------------------- LSP --------------------
    use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- ui
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    -- 代码格式化
    -- use("mhartington/formatter.nvim")
    use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim", "lewis6991/gitsigns.nvim" } })
    -- JSON 增强
    use("b0o/schemastore.nvim")
    -- TypeScript 增强
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
    -- Rust 增强
    use("simrat39/rust-tools.nvim")
    -- git
    use({ "lewis6991/gitsigns.nvim" })
    -- 匹配符号补全
    use("windwp/nvim-autopairs")
    -- 注释
    use("numToStr/Comment.nvim")
    -- surround
    use("ur4ltz/surround.nvim")
    -- terminal
    use({ "akinsho/toggleterm.nvim" })
    -- 输入法切换
    use({ "ybian/smartim" })
    -- Json 格式化
    use({ "axiaoxin/vim-json-line-format" })
    -- 滚动条
    use({ "petertriho/nvim-scrollbar" })
    -- 文本对齐
    use({ "godlygeek/tabular" })
    -- Markdown 表格
    use({ "dhruvasagar/vim-table-mode" })
    -- 大纲
    use({ "stevearc/aerial.nvim" })
    -- 搜索高亮提示
    use({ "kevinhwang91/nvim-hlslens" })
    -- 多光标
    use({ "mg979/vim-visual-multi" })
    -- Markdown 预览
    use({ "iamcco/markdown-preview.nvim" })
    -- 打开文件时自动跳转到光标上次所在位置
    use({ "ethanholz/nvim-lastplace" })
    -- 交换参数位置
    use({ "mizlan/iswap.nvim" })
end)

-- -- 每次保存 plugins.lua 自动安装插件
-- pcall(
--     vim.cmd,
--     [[
--     augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--     augroup end
--   ]]
-- )
