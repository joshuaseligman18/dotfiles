return {
    "joshuaseligman18/fork-inator.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local forkInator = require('fork-inator')

        forkInator.setup()
        vim.keymap.set('n', '<leader>fi', function() forkInator.toggle() end)
    end,
}
