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
            { "<leader>ha", desc = "Add to Harpoon" },
            { "<leader>he", desc = "Harpoon Directory" },
            { "<leader>hh", desc = "Harpoon File #1" },
            { "<leader>ht", desc = "Harpoon File #2" },
            { "<leader>hn", desc = "Harpoon File #3" },
            { "<leader>hs", desc = "Harpoon File #4" },
        })
    end,
}
