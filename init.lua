--[[
-- Setup initial configuration,
-- 
-- Primarily just download and execute lazy.nvim
--]]
CONFIG_START_TIME = vim.loop.hrtime()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

-- Clipboard fix
vim.o.clipboard = 'unnamedplus'

-- Add lazy to the `runtimepath`, this allows us to `require` it.
vim.opt.rtp:prepend(lazypath)

-- Set up lazy, and load my `lua/custom/plugins/` folder
require("lazy").setup({ import = "custom.plugins" }, {
  change_detection = {
    notify = false,
  },
})

CONFIG_START_TIME = vim.loop.hrtime()