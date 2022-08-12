local status, db = pcall(require, "dashboard")
if not status then
    vim.notify("没有找到 dashboard")
    return
end

db.preview_file_height = 12
db.preview_file_width = 80
db.header_pad = 1
db.center_pad = 1
db.footer_pad = 1

-- db.custom_header = {
--     [[          ▀████▀▄▄              ▄█ ]],
--     [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
--     [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
--     [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
--     [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
--     [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
--     [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
--     [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
--     [[   █   █  █      ▄▄           ▄▀   ]],
-- }

db.custom_header = {
    [[ _  ___   _ ____      _    _   _    _    ____   ___  ]],
    [[| |/ / | | |  _ \    / \  | \ | |  / \  |  _ \ / _ \ ]],
    [[| ' /| | | | |_) |  / _ \ |  \| | / _ \ | | | | | | |]],
    [[| . \| |_| |  _ <  / ___ \| |\  |/ ___ \| |_| | |_| |]],
    [[|_|\_\\___/|_| \_\/_/   \_\_| \_/_/   \_\____/ \___/ ]],
    [[                                                     ]],
}

db.custom_center = {
    {
        icon = "  ",
        desc = "Projects        ",
        action = "Telescope projects",
    },
    {
        icon = "  ",
        desc = "Recently files  ",
        action = "Telescope oldfiles",
    },
    {
        icon = "  ",
        desc = "Edit keybindings",
        action = "edit ~/.config/nvim/lua/keybindings.lua",
    },
    {
        icon = "  ",
        desc = "Edit Projects   ",
        action = "edit ~/.local/share/nvim/project_nvim/project_history",
    },
    {
        icon = "  ",
        desc = "Change Theme    ",
        action = "Telescope colorscheme",
    },
}

db.custom_footer = {
    "https://github.com/KURANADO2",
}
