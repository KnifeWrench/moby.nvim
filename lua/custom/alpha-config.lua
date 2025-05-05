local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

    [[__/\\\\____________/\\\\_______/\\\\\_______/\\\\\\\\\\\\\____/\\\________/\\\_       ]],
    [[ _\/\\\\\\________/\\\\\\_____/\\\///\\\____\/\\\/////////\\\_\///\\\____/\\\/__       ]],
    [[  _\/\\\//\\\____/\\\//\\\___/\\\/__\///\\\__\/\\\_______\/\\\___\///\\\/\\\/____      ]],
    [[   _\/\\\\///\\\/\\\/_\/\\\__/\\\______\//\\\_\/\\\\\\\\\\\\\\______\///\\\/______     ]],
    [[   _\/\\\__\///\\\/___\/\\\_\/\\\_______\/\\\_\/\\\/////////\\\_______\/\\\_______    ]],
    [[     _\/\\\____\///_____\/\\\_\//\\\______/\\\__\/\\\_______\/\\\_______\/\\\_______   ]],
    [[      _\/\\\_____________\/\\\__\///\\\__/\\\____\/\\\_______\/\\\_______\/\\\_______  ]],
    [[       _\/\\\_____________\/\\\____\///\\\\\/_____\/\\\\\\\\\\\\\/________\/\\\_______ ]],
    [[        _\///______________\///_______\/////_______\/////////////__________\///________]],

}

 dashboard.section.buttons.val = {
   dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
   dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
   dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
   dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
   dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
 return "Don't Stop Until You are Proud..."
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)