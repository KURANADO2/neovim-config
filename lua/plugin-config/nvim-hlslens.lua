local status, surround = pcall(require, "hlslens")
if not status then
    vim.notify("没有找到 hlslens")
    return
end

surround.setup()
