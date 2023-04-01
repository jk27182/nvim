-- remap to open the Telescope refactoring menu in visual mode
require('refactoring').setup({})
-- refactoring
vim.api.nvim_set_keymap(
    "v",
    "<leader>rr",
    "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
    { noremap = true }
)

