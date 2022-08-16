-- 基础设置
require("basic")
-- Packer 插件管理
require("plugins")
-- 快捷键映射
require("keybindings")
-- 主题设置 （新增）
require("colorscheme")
-- 自动命令
require("autocmds")
-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
-- require("plugin-config.lualine")
require("plugin-config.windline")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")
require("plugin-config.gitsigns")
require("plugin-config.nvim-autopairs")
require("plugin-config.comment")
require("plugin-config.surround")
require("plugin-config.toggleterm")
require("plugin-config.smartim")
require("plugin-config.nvim-scrollbar")
require("plugin-config.tabular")
require("plugin-config.aerial")
require("plugin-config.nvim-markdown-preview")
require("plugin-config.nvim-lastplace")

-- 内置 LSP
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
-- require("lsp.formatter")
require("lsp.null-ls")
