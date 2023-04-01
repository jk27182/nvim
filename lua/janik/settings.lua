-- [[ Setting options ]]
-- See `:help vim.o`
-- Das bei Split das Fenster immer 'below' statt above ist
vim.o.splitbelow = true
-- Bei True bei Split das Fenster immer rechts statt links ist 
vim.o.splitright = true

vim.o.wrap = false

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
require("bufferline").setup{}
vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Tabs to 4 spaces
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
