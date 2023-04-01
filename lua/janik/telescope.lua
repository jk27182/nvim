-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "Library", "Applications", "System" },
        mappings = {
            i = {
                    ['<C-u>'] = false,
                    ['<C-d>'] = false,
            },
        },
    },
}

-- telescope file_browser setup
local fb_actions = require "telescope._extensions.file_browser.actions"
require("telescope").setup {
    extensions = {
        file_browser = {
            -- path
            -- cwd
            theme = 'ivy',
            cwd_to_path = false,
            grouped = false,
            files = true,
            add_dirs = true,
            depth = 1,
            auto_depth = false,
            select_buffer = false,
            hidden = false,
            -- respect_gitignore
            -- browse_files
            -- browse_folders
            hide_parent_dir = false,
            collapse_dirs = false,
            quiet = false,
            dir_icon = "",
            dir_icon_hl = "Default",
            display_stat = { date = true, size = true },
            hijack_netrw = false,
            use_fd = true,
            git_status = true,
            mappings = {
                    ["i"] = {
                        ["<A-c>"] = fb_actions.create,
                        ["<S-CR>"] = fb_actions.create_from_prompt,
                        ["<A-r>"] = fb_actions.rename,
                        ["<A-m>"] = fb_actions.move,
                        ["<A-y>"] = fb_actions.copy,
                        ["<A-d>"] = fb_actions.remove,
                        ["<C-o>"] = fb_actions.open,
                        ["<C-g>"] = fb_actions.goto_parent_dir,
                        ["<C-e>"] = fb_actions.goto_home_dir,
                        ["<C-w>"] = fb_actions.goto_cwd,
                        ["<C-t>"] = fb_actions.change_cwd,
                        ["<C-f>"] = fb_actions.toggle_browser,
                        ["<C-h>"] = fb_actions.toggle_hidden,
                        ["<C-s>"] = fb_actions.toggle_all,
                },
                    ["n"] = {
                        ["c"] = fb_actions.create,
                        ["r"] = fb_actions.rename,
                        ["m"] = fb_actions.move,
                        ["y"] = fb_actions.copy,
                        ["d"] = fb_actions.remove,
                        ["o"] = fb_actions.open,
                        ["h"] = fb_actions.goto_parent_dir,
                        ["x"] = require("telescope.actions").select_default,
                        ["e"] = fb_actions.goto_home_dir,
                        ["w"] = fb_actions.goto_cwd,
                        ["t"] = fb_actions.change_cwd,
                        ["f"] = fb_actions.toggle_browser,
                        ["<C-h>"] = fb_actions.toggle_hidden,
                        ["s"] = fb_actions.toggle_all,
                },
            },
        },
    },
}
require("telescope").load_extension "file_browser"

--
vim.api.nvim_set_keymap(
    "n",
    "<space>fE",
    "<cmd>Telescope file_browser<CR>",
    { noremap = true }
)

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
    "n",
    "<space>fe",
    "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { noremap = true }
)
-- require('explorer_plugin.neo-tree_config')
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- local function test()
--    return function ()
--       require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--       winblend = 10,
--       previewer = false,
--     })
--    end
-- end
-- See `:help telescope.builtin`
-- vim.keymap.set('n', '<leader>/', "<cmd>Telescope current_buffer_fuzzy_find<CR> <bar> z.", { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sb', function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
        })
    end,
    { desc = '[/] Fuzzily search in current buffer]' }
)
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').git_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
