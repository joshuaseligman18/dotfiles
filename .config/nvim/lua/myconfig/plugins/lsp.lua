return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        "j-hui/fidget.nvim",
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({buffer = bufnr})

            -- gl was not working by default
            vim.keymap.set('n', 'gl', function()
                vim.diagnostic.open_float()
            end, {buffer = bufnr})
        end)

        require('fidget').setup({})
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'rust_analyzer',
                'tsserver',
                'lua_ls',
                'clangd',
                'pylsp'
            },
            handlers = {
                lsp_zero.default_setup,
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,
                ['rust_analyzer'] = function()
                    require('lspconfig').rust_analyzer.setup {
                        settings = {
                            ['rust-analyzer'] = {
                                check = {
                                    command = 'clippy'
                                }
                            }
                        }
                    }
                end,
                ['gopls'] = function()
                    require('lspconfig').gopls.setup {
                        cmd = { 'gopls' }
                    }
                end,
            },
        })
    end,

    vim.diagnostic.config({
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })
}

