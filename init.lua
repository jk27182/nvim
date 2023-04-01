require('janik.plugin_install')
require('janik.settings')
require('janik.keymaps')
require('janik.telescope')
require('janik.treesitter')
require('janik.refactoring')
require('janik.git')
require('janik.lsp')


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
    },
}
-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
    show_current_context = true,
    show_current_context_start = true,
    -- char = '┊',
    -- show_trailing_blankline_indent = false,
}


require('toggleterm').setup {
    open_mapping = [[<C-t>]],
    start_in_insert = true,
}
-- vim.keymap.set('n', '[[<C-t>]]',"<cmd>ToggleTerm dir=%:h<CR>", { desc = 'Oeffnen eines Terminals vom momentaten dir' })


-- kitty specific
vim.cmd("source ~/.config/nvim_eigene_config/nvim/kitty_settings.vim")


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
