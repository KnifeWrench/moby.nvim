local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

    [[__/\\\\____________/\\\\_______/\\\\\_______/\\\\\\\\\\\\\____/\\\________/\\\_        ]],
    [[ _\/\\\\\\________/\\\\\\_____/\\\///\\\____\/\\\/////////\\\_\///\\\____/\\\/__       ]],
    [[  _\/\\\//\\\____/\\\//\\\___/\\\/__\///\\\__\/\\\_______\/\\\___\///\\\/\\\/____      ]],
    [[   _\/\\\\///\\\/\\\/_\/\\\__/\\\______\//\\\_\/\\\\\\\\\\\\\\______\///\\\/______     ]],
    [[    _\/\\\__\///\\\/___\/\\\_\/\\\_______\/\\\_\/\\\/////////\\\_______\/\\\_______    ]],
    [[     _\/\\\____\///_____\/\\\_\//\\\______/\\\__\/\\\_______\/\\\_______\/\\\_______   ]],
    [[      _\/\\\_____________\/\\\__\///\\\__/\\\____\/\\\_______\/\\\_______\/\\\_______  ]],
    [[       _\/\\\_____________\/\\\____\///\\\\\/_____\/\\\\\\\\\\\\\/________\/\\\_______ ]],
    [[        _\///______________\///_______\/////_______\/////////////__________\///________]],
    [[                                                                                       ]],
}

 dashboard.section.buttons.val = {
    dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("b", "  File Browser", ":Oil<CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    --    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("l", "󰒲  Load Lazy", ":Lazy<CR>"),
    dashboard.button("c", "  Neovim Config", ":lua require('telescope.builtin').find_files { cwd = vim.fn.stdpath('config') }<CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
    local lazy_stats = require("lazy").stats()
    local version = vim.version()
    local nvim_version = string.format("🧪  Neovim:          v%d.%d.%d", version.major, version.minor, version.patch)

    -- TODO: Config load time 
    -- Use current time if CONFIG_END_TIME is not set
    -- local end_time = CONFIG_END_TIME or vim.loop.hrtime()
    -- local elapsed_time = (end_time - CONFIG_START_TIME) / 1e6 -- Convert nanoseconds to milliseconds
    -- local config_time = string.format("🕒  Config loaded in: %.2f ms", elapsed_time)

    return {
        "", 
        "   Plugins loaded:  " .. lazy_stats.loaded .. " / " .. lazy_stats.count,
        nvim_version,
        -- config_time,
    }
end

-- Set the initial footer
dashboard.section.footer.val = footer()

-- Periodically update the footer as plugins are being loaded
local timer = vim.loop.new_timer()
timer:start(0, 100, vim.schedule_wrap(function()
    dashboard.section.footer.val = footer()
    alpha.redraw() -- Redraw the Alpha dashboard to reflect the updated footer
    if require("lazy").stats().loaded == require("lazy").stats().count then
        timer:stop() -- Stop the timer once all plugins are loaded
    end
end))


dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)