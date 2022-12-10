-- 如果找不到lualine 组件，就不继续执行
local status, im_select = pcall(require, "im_select")
if not status then
    vim.notify("没有找到 im_select")
    return
end
im_select.setup({
    -- IM will be set to `default_im_select` in `normal` mode(`EnterVim` or `InsertLeave`)
    -- For Windows, default: "1003", aka: English US Keyboard
    -- You can use `im-select` in cli to get the IM name of you preferred
    default_im_select = "com.apple.keylayout.ABC",

    -- Set to 1 if you don't want restore IM status when `InsertEnter`
    disable_auto_restore = 0,
})
