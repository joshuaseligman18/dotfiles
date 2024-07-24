return {
    'voldikss/vim-floaterm',
    config = function ()
        vim.keymap.set('n', '<leader>ft', '<CMD>FloatermToggle<CR>')
    end,
}
