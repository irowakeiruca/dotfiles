return {
    { -- colorscheme
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require('tokyonight').setup({
                style = "moon",
                transparent = true
            })
            vim.cmd([[colorscheme tokyonight]])
        end
    },
    'editorconfig/editorconfig-vim',
    {
        --"romgrk/barbar.nvim",
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'lewis6991/gitsigns.nvim',
            'SmiteshP/nvim-navic'
        },
        config = function()
            require('lualine').setup({
                options = {
                    icons_enabled = true,
                    theme = 'dolphin',
                    disabled_filetypes = {},
                    always_divide_middle = true,
                    colored = true,
                    globalstatus = true,
                    --component_separators = { left = '', right = ''},
                    --section_separators = { left = '', right = '' },
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff' },
                    lualine_c = {
                        {
                            'filename',
                            path = 1,
                            file_status = true,
                            shorting_target = 40,
                            symbols = {
                                modified = ' _󰷥',
                                readonly = ' ',
                                unnamed = 'Untitled',
                            }
                        },
                    },
                    lualine_x = { 'filetype', 'encoding' },
                    lualine_y = {
                        {
                            'diagnostics',
                            source = { 'nvim-lsp' },
                        }
                    },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {
                    lualine_a = {
                        {
                            'buffers',
                            symbols = { modified = '_󰷥', alternate_file = ' ', directory = ' ' },
                        },
                    },
                    lualine_b = {},
                    lualine_c = {
                        { 'navic' }
                    },
                    lualine_x = {
                        'diff'
                    },
                    lualine_y = {
                        'branch'
                    },
                    lualine_z = {
                        { 'tabs', tabs_color = switch_color },
                    },
                },
                extensions = {}
            })
            vim.api.nvim_set_option('showmode', false)
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs                        = {
                    add = { hl = 'GitSignsAdd', text = '▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
                    change = { hl = 'GitSignsChange', text = '▎', numhl = 'GitSignsChangeNr',
                        linehl = 'GitSignsChangeLn' },
                    delete = { hl = 'GitSignsDelete', text = '', numhl = 'GitSignsDeleteNr',
                        linehl = 'GitSignsDeleteLn' },
                    topdelete = { hl = 'GitSignsDelete', text = '', numhl = 'GitSignsDeleteNr',
                        linehl = 'GitSignsDeleteLn' },
                    changedelete = { hl = 'GitSignsChange', text = '▎', numhl = 'GitSignsChangeNr',
                        linehl = 'GitSignsChangeLn' },
                },
                signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
                numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir                 = {
                    interval = 1000,
                    follow_files = true
                },
                attach_to_untracked          = true,
                current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts      = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
                sign_priority                = 6,
                update_debounce              = 100,
                status_formatter             = nil, -- Use default
                max_file_length              = 40000, -- Disable if file is longer than this (in lines)
                preview_config               = {
                    -- Options passed to nvim_open_win
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
                yadm                         = {
                    enable = false
                },
            }
        end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
            vim.api.nvim_set_keymap('n', '<C-_>', 'gcc', {})
            vim.api.nvim_set_keymap('v', '<C-_>', 'gc', {})
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-telescope/telescope.nvim'
        },
        config = function()
            vim.api.nvim_create_user_command('Ex', function() vim.cmd.NvimTreeToggle() end, {})
            vim.keymap.set('n', '<C-f>', vim.cmd.NvimTreeToggle)
            require("nvim-tree").setup({
                sort_by = 'extension',

                view = {
                    width = '20%',
                    side = 'right',
                    signcolumn = 'no',
                },

                renderer = {
                    highlight_git = true,
                    highlight_opened_files = 'name',
                    icons = {
                        glyphs = {
                            git = {
                                unstaged = '!',
                                renamed = '»',
                                untracked = '?',
                                deleted = '✘',
                                staged = '✓',
                                unmerged = '',
                                ignored = '◌',
                            },
                        },
                    },
                },

                actions = {
                    expand_all = {
                        max_folder_discovery = 100,
                        exclude = { '.git', 'target', 'build' },
                    },
                },

                on_attach = require('extensions.nvim-tree-actions').on_attach
            })
        end
    },
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',

        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    "typescript",
                    "javascript",
                    "rust",
                    "python",
                    "go",
                    "lua",
                    "bash",
                    "html",
                    "css",
                    "vue",
                    "vim",
                    "yaml",
                    "toml",
                    "ini",
                    "json",
                    "dockerfile",
                    "markdown",
                    "diff",
                    "gitignore"
                },
                highlight = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = 'gnn',
                        node_incremental = 'grn',
                        scope_incremental = 'grc',
                        node_decremental = 'grm',
                    },
                },
                indent = {
                    enable = true,
                },
            }
        end
    },
    {
        'kevinhwang91/nvim-hlslens',
        config = function()
            require('hlslens').setup()

            vim.keymap.set({ 'n', 'x' }, '<Leader>L', function()
                vim.schedule(function()
                    if require('hlslens').exportLastSearchToQuickfix() then
                        vim.cmd('cw')
                    end
                end)
                return ':noh<CR>'
            end, { expr = true })
            vim.opt.shortmess:append 'S'
        end
    },
    --    {
    --        'petertriho/nvim-scrollbar',
    --        dependencies = {
    --            'kevinhwang91/nvim-hlslens',
    --            'lewis6991/gitsigns.nvim'
    --        },
    --        event = {
    --            "BufWinEnter",
    --            "CmdwinLeave",
    --            "TabEnter",
    --            "TermEnter",
    --            "TextChanged",
    --            "VimResized",
    --            "WinEnter",
    --            "WinScrolled",
    --        },
    --        config = function()
    --            require('scrollbar').setup()
    --            require('scrollbar.handlers.search').setup()
    --            require("scrollbar.handlers.gitsigns").setup()
    --        end
    --    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build =
                'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            }
        },

        config = function()
            local telescope = require('telescope')

            telescope.setup({
                pickers = {
                    find_files = {
                        hidden = true
                    }
                },
                defaults = {
                    mappings = {
                        i = {
                            ['<C-h>'] = 'which_key',
                        },
                    },
                    winblend = 30,
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    }
                }
            })

            local themes = require 'telescope.themes'
            telescope.load_extension('fzf')
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>h', function()
                builtin.help_tags(themes.get_ivy())
            end)

            vim.keymap.set('n', '<leader>ff', builtin.find_files)
            vim.keymap.set('n', '<leader>fg', builtin.live_grep)
            vim.keymap.set('n', '<leader>fb', builtin.buffers)
            vim.keymap.set('n', '<leader>fh', builtin.help_tags)
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            require 'extensions.nvim-lspconfig'
        end,
    },
    {
        'williamboman/mason.nvim',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            require('mason').setup {
                ui = {
                    check_outdated_packages_on_open = false,
                    border = 'single',
                },
            }
            require('mason-lspconfig').setup_handlers {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),
                    }
                end,
            }
        end,
    },
    {
        'SmiteshP/nvim-navic',
        dependencies = {
            'neovim/nvim-lspconfig'
        },
        config = function()
            require('nvim-navic').setup {
                lsp = {
                    auto_attach = true,
                },
                highlight = true,
                icons = {
                    File = ' ',
                    Module = ' ',
                    Namespace = ' ',
                    Package = ' ',
                    Class = ' ',
                    Method = ' ',
                    Property = ' ',
                    Field = ' ',
                    Constructor = ' ',
                    Enum = ' ',
                    Interface = ' ',
                    Function = ' ',
                    Variable = ' ',
                    Constant = ' ',
                    String = ' ',
                    Number = ' ',
                    Boolean = ' ',
                    Array = ' ',
                    Object = ' ',
                    Key = ' ',
                    Null = ' ',
                    EnumMember = ' ',
                    Struct = ' ',
                    Event = ' ',
                    Operator = ' ',
                    TypeParameter = ' ',
                },
                depth_limit = 9,
            }
            vim.api.nvim_create_autocmd("BufEnter", {
                group = vim.api.nvim_create_augroup('nvim-navic', {}),
                callback = function()
                    if vim.api.nvim_buf_line_count(0) > 10000 then
                        vim.b.navic_lazy_update_context = true
                    end
                end,
            })
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'onsails/lspkind.nvim',
        },
        config = function()
            local cmp = require('cmp')
            local lspkind = require('lspkind')
            local luasnip = require('luasnip')
            local map = cmp.mapping

            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
            end

            cmp.setup {
                completion = {
                    completeopt = 'menu,menuone,noinsert'
                },
                mapping = map.preset.insert {
                    ['<C-d>'] = map.scroll_docs(-4),
                    ['<C-f>'] = map.scroll_docs(4),
                    ['<C-a>'] = map.complete(),
                    ['<C-e>'] = map.abort(),
                    ['<CR>'] = map.confirm { select = true },

                    ['<tab>'] = map(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                            -- they way you will only jump inside the snippet region
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    ['<C-tab>'] = map(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },

                cmp.setup.cmdline({ '/', '?' }, {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources {
                        {
                            name = 'buffer',
                            option = {
                                keyword_pattern = [[\k\+]],
                            },
                        },
                    },
                }),

                cmp.setup.cmdline(':', {
                    mapping = cmp.mapping.preset.cmdline(),
                    sources = cmp.config.sources {
                        { name = 'cmdline' },
                    },
                }),

                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                },

                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered({
                        border = 'single'
                    }),
                    documentation = cmp.config.window.bordered({
                        border = 'single'
                    }),
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol',
                        maxwidth = 50,
                        ellipsis_char = '...',
                    })
                },
            }
        end,
    },
    {
        'L3MON4D3/LuaSnip',
        --tag = "v1.*",
        run = 'make install_jsregexp',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load({
            })
        end,
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets'
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_enable_last_session = true,
                auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
                auto_session_enabled = true,
            }
        end
    },
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup {
            }
        end
    },
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enable = false,
			}
		end,
	},
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },

        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            timeout = 2000,
        },
    },
}
