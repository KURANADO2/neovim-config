local opts = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    flags = {
        debounce_text_changes = 150,
    },
    on_attach = function(client, bufnr)
        -- 禁用格式化功能，交给专门插件插件处理
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- 绑定快捷键
        require("keybindings").mapLSP(buf_set_keymap)
    end,
}

return {
    on_setup = function(server)
        -- Initialize the LSP via rust-tools instead
        require("rust-tools").setup({
            -- The "server" property provided in rust-tools setup function are the
            -- settings rust-tools will provide to lspconfig during init.
            -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
            -- with the user's own settings (opts).
            server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
        })
        server:attach_buffers()
        -- Only if standalone support is needed
        -- require("rust-tools").start_standalone_if_required()
    end,
}
