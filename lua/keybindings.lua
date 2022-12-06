vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = false }

-- 取消 s 默认功能
map("n", "s", "", opt)
-- 窗口分割快捷键
map("n", "sh", ":set nosplitright<CR>:vsplit<CR>", opt)
map("n", "sj", ":set splitbelow<CR>:split<CR>", opt)
map("n", "sk", ":set nosplitbelow<CR>:split<CR>", opt)
map("n", "sl", ":set splitright<CR>:vsplit<CR>", opt)
-- 水平布局转换成垂直布局
map("n", "sf", "<C-w>t<C-w>H", opt)
-- 垂直布局转换成水平布局
map("n", "sd", "<C-w>t<C-w>K", opt)
-- 窗口跳转
map("n", "<LEADER>h", "<C-w>h", opt)
map("n", "<LEADER>j", "<C-w>j", opt)
map("n", "<LEADER>k", "<C-w>k", opt)
map("n", "<LEADER>l", "<C-w>l", opt)
-- 窗口比例调整
map("n", "<up>", ":res +5<CR>", opt)
map("n", "<down>", ":res -5<CR>", opt)
map("n", "<left>", ":vertical resize-5<CR>", opt)
map("n", "<right>", ":vertical resize+5<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)

-- Terminal相关
map("t", "<Esc>", "<C-\\><C-n>", opt)

-- 光标移动
map("", "<C-j>", "5j", opt)
map("", "<C-k>", "5k", opt)
map("", "<C-h>", "^", opt)
map("", "<C-l>", "$", opt)

-- visual 模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 对调行模式和块模式
map("n", "<C-v>", "V", opt)
map("n", "V", "<C-v>", opt)

-- 选中文本
map("", "v<C-h>", "v^", opt)
map("", "v<C-l>", "v$h", opt)
map("", "vie", "ggVG", opt)
-- 在行尾添加分号
map("n", "<LEADER>;", "A;<Esc>", opt)

-- 上下翻页
map("n", "J", "5<C-e>", opt)
map("n", "K", "5<C-y>", opt)
-- 左右翻页
map("n", "H", "50zh", opt)
map("n", "L", "50zl", opt)

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 大小写
map("", "`", "~", opt)

-- 重做
map("n", "U", "<C-r>", opt)

-- 搜索
map("n", "n", "nzz", opt)
map("n", "N", "Nzz", opt)
map("n", "*", "*zz", opt)
map("n", "#", "#zz", opt)

-- 替换
map("", "\\s", ":%s///g<left><left><left>", opt)

-- 取消高亮
map("n", "<LEADER><CR>", ":nohlsearch<CR>", opt)

-- 录制宏
map("n", "sg", "q", opt)

-- 保存
map("", "S", ":w<CR>", opt)

-- 退出
-- map("n", "qq", ":q!<CR>", opt)
-- 关闭当前 buffer See Also: https://github.com/akinsho/bufferline.nvim/issues/513
map("n", "q", ":bp <BAR> bd #<CR>", opt)
-- 退出
map("", "Q", ":q<CR>", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- 打开/关闭 tree
map("n", "tt", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
    -- 分屏打开文件
    { key = "v", action = "vsplit" },
    { key = "h", action = "split" },
    -- 显示隐藏文件
    { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
    { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
    -- 文件操作
    { key = "R", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "r", action = "rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    -- 在 Finder 中打开目录
    { key = "s", action = "system_open" },
    -- 展开所有目录
    { key = "E", action = "expand_all" },
    -- 缩起所有目录
    { key = "W", action = "collapse_all" },
}

-- bufferline
-- 左右Tab切换
map("n", "E", ":BufferLineCyclePrev<CR>", opt)
map("n", "R", ":BufferLineCycleNext<CR>", opt)
map("n", "W", ":BufferLineGoToBuffer 1<CR>", opt)
map("n", "T", ":BufferLineGoToBuffer -1<CR>", opt)
map("n", "th", ":BufferLineMovePrev<CR>", opt)
map("n", "tl", ":BufferLineMoveNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<LEADER>ff", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<LEADER>fg", ":Telescope live_grep<CR>", opt)
-- 定位文件
map("n", "<LEADER>n", ":NvimTreeFindFile<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- 历史记录
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- 关闭窗口
        ["<C-c>"] = "close",
        -- 预览窗口上下滚动
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
    -- rename
    --[[
  Lspsaga 替换 rn
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  --]]
    mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
    -- code action
    --[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  --]]
    mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
    -- go xx
    --[[
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  --]]
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    --[[
  Lspsaga 替换 gh
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  --]]
    mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
    --[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
    mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
    --[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
    -- diagnostic
    mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
    mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
    mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
    -- 未用
    -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    }
end

-- typescript 快捷键
pluginKeys.mapTsLSP = function(mapbuf)
    mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
    mapbuf("n", "gr", ":TSLspRenameFile<CR>", opt)
    mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end

-- gitsigns
pluginKeys.gitsigns_on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "<leader>gj", function()
        if vim.wo.diff then
            return "]c"
        end
        vim.schedule(function()
            gs.next_hunk()
        end)
        return "<Ignore>"
    end, { expr = true })

    map("n", "<leader>gk", function()
        if vim.wo.diff then
            return "[c"
        end
        vim.schedule(function()
            gs.prev_hunk()
        end)
        return "<Ignore>"
    end, { expr = true })

    map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")
    map("n", "<leader>gS", gs.stage_buffer)
    map("n", "<leader>gu", gs.undo_stage_hunk)
    map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
    map("n", "<leader>gR", gs.reset_buffer)
    map("n", "<leader>gp", gs.preview_hunk)
    map("n", "<leader>gb", function()
        gs.blame_line({ full = true })
    end)
    map("n", "<leader>gd", gs.diffthis)
    map("n", "<leader>gD", function()
        gs.diffthis("~")
    end)
    -- toggle
    map("n", "<leader>gtd", gs.toggle_deleted)
    map("n", "<leader>gtb", gs.toggle_current_line_blame)
    -- Text object
    map({ "o", "x" }, "ig", ":<C-U>Gitsigns select_hunk<CR>")
end

-- comment
pluginKeys.comment = {
    -- Normal 模式快捷键
    toggler = {
        line = "gcc", -- 行注释
        block = "gbc", -- 块注释
    },
    -- Visual 模式
    opleader = {
        line = "gc",
        bock = "gb",
    },
}
-- ctrl + /
map("n", "<C-_>", "gcc", { noremap = false })
map("v", "<C-_>", "gc", { noremap = false })

-- 自定义 toggleterm 3 个不同类型的命令行窗口
-- <leader>ta 浮动
-- <leader>tb 右侧
-- <leader>tc 下方
-- 特殊lazygit 窗口，需要安装lazygit
-- <leader>tg lazygit
pluginKeys.mapToggleTerm = function(toggleterm)
    vim.keymap.set({ "n", "t" }, "<leader>ta", toggleterm.toggleA)
    vim.keymap.set({ "n", "t" }, "<leader>tb", toggleterm.toggleB)
    vim.keymap.set({ "n", "t" }, "<leader>tc", toggleterm.toggleC)
    vim.keymap.set({ "n", "t" }, "<leader>tg", toggleterm.toggleG)
end

-- tabular
pluginKeys.mapTabular = function()
    map("n", "<LEADER>a", ":Tabular /", opt)
end

-- aerial
pluginKeys.mapAerial = function(bufnr)
    -- Toggle the aerial window with <leader>a
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>o", "<cmd>AerialToggle!<CR>", {})
    -- Jump forwards/backwards with '{' and '}'
    vim.api.nvim_buf_set_keymap(bufnr, "n", "{", "<cmd>AerialPrev<CR>", {})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "}", "<cmd>AerialNext<CR>", {})
    -- Jump up the tree with '[[' or ']]'
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", "<cmd>AerialPrevUp<CR>", {})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", "<cmd>AerialNextUp<CR>", {})
end

-- nvim-markdown-preview
pluginKeys.mapMarkdownPreview = function()
    map("n", "<LEADER>mp", ":MarkdownPreview<CR>", opt)
end

-- nvim-markdown-preview
pluginKeys.mapIswap = function()
    map("n", "<LEADER>sw", ":ISwapWith<CR>", opt)
end

return pluginKeys
