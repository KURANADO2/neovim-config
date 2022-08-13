local status, windline = pcall(require, "windline")
if not status then
    vim.notify("没有找到 windline")
    return
end

require("wlsample.airline")
