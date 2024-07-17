local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

local luasnip = require("luasnip")
local lspkind = require('lspkind')
local cmp = require("cmp")

cmp.setup({

    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },

    mapping = {
        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable( -1) then
                luasnip.jump( -1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },

    -- Let's configure the item's appearance
    -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- maxwidth of the kind
            ellipsis = '...', -- symbol for a collapsed item
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default
            before = function (entry, vim_item)
                return vim_item
            end
        })
    },

    -- Set source precedence
    sources = cmp.config.sources({
        -- { name = 'copilot' },     -- For copilot
        { name = 'nvim_lsp' },    -- For nvim-lsp
        { name = 'luasnip' },     -- For luasnip user
        { name = 'buffer' },      -- For buffer word completion
        { name = 'path' },        -- For path completion
    })
})

