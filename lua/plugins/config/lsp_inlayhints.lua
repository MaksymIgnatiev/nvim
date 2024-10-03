local lang = {}
local lang_include = { "typescript", "python", "rust" }


for _, key in ipairs(lang_include) do
	lang[key] = { inlay_hints = { show = true } }
end


require("lsp-inlayhints").setup({
    inlay_hints = {
        parameter_hints = {
            show = true,       -- Show parameter hints
            highlight = "Comment", -- Highlight group for parameter hints
            prefix = "-> ",    -- Prefix for parameter hints
        },
        type_hints = {
            show = true,       -- Show type hints
            highlight = "Comment", -- Highlight group for type hints
            prefix = "<-",     -- Prefix for type hints
        },
        other_hints = {
            show = true,       -- Show other hints (like return types)
            highlight = "Comment",
        },
    },
    debug = false,
    lang = lang,
})
