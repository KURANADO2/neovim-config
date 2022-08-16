local status, lastplace = pcall(require, "nvim-lastplace")
if not status then
    vim.notify("没有找到 lastplace")
    return
end

lastplace.setup({
    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
    lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
    lastplace_open_folds = true,
})
