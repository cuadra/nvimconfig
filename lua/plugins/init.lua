
vim.wo.relativenumber = true
vim.wo.number = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone","--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local plugins = {
{
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = {{'echasnovski/mini.icons', opts = {} }}
},
{
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig'
},
{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
{
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' }
},
{
'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}
}
local opts = {}
--require('oil').setup()
require('lazy').setup(plugins, opts)
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed={'ts_ls'}
})
require("lualine").setup()

local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup({})

local builtin = require("telescope.builtin")
--vim.keymap.set('n', '<C-f', builtin.find_files, {})
--vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

