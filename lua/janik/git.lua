require("neogit").setup {
    disable_insert_on_commit = false,
    disable_commit_confirmation = true
}

-- Git status mit magit im Dir wo nvim im Terminal gestartet wurde
vim.keymap.set({'n', 'v'}, '<leader>gG', function () require('neogit').open() end)
local function getDir(path)
  print(path:match("^(.-)[\\/][^\\/]-$"))
  return path:match("^(.-)[\\/][^\\/]-$")
end

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
}


-- Git status mit magit im Dir von dem File des Buffers
vim.keymap.set({'n', 'v'}, '<leader>gg', function ()
  require('neogit').open({
    cwd=getDir(vim.api.nvim_buf_get_name(0))
  })
end)

-- git Shortcuts
-- vim.keymap.set({'n', 'v'}, '<leader>gs', "<cmd>G status<CR>")
-- vim.keymap.set({'n', 'v'}, '<leader>gd', "<cmd>G diff<CR>")
-- vim.keymap.set({'n', 'v'}, '<leader>gg', "<cmd>G<CR>")
