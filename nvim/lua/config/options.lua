-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Set vim options
vim.opt.textwidth = 80 -- This will automatically wrap lines when you are inserting text and go over 80 characters.
vim.opt.colorcolumn = "80" -- This will display a vertical line at column 80 to guide you.
-- To control visual wrapping of long lines (does not insert a newline character)
vim.opt.wrap = true -- This will wrap long lines visually so you can see the whole line.
-- For better wrapping behavior (optional)
vim.opt.linebreak = true -- This will wrap lines at word boundaries instead of in the midd of a word.
