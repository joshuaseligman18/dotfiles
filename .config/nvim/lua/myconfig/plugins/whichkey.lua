return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        plugins = { spelling = true },
        defaults = {
            mode = { "n", "v" },
        },
        icons = {
            mappings = false,
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.add(opts.defaults)

        wk.add({
            { "<leader>pv", desc = "File Explorer" },
            { "<leader>pf", desc = "Project Files" },
            { "<leader>ps", desc = "Grep Search" },
            { "<C-p>", desc = "Git Files" },
            { "<leader>a", desc = "Add to Harpoon" },
            { "<C-e>", desc = "Harpoon Directory" },
            { "<C-h>", desc = "Harpoon File #1" },
            { "<C-t>", desc = "Harpoon File #2" },
            { "<C-n>", desc = "Harpoon File #3" },
            { "<C-s>", desc = "Harpoon File #4" },
        })
    end,
}
