-- Custom colors for treesitter

local link = require("global.theme.config").link

link("@attribute.builtin", "Red")
link("@character.special", "Constant")
link("@constant.builtin", "Constant")
link("@constant", "Constant")
link("@constructor", "Constant")
link("@function.arrow", "Constant")
link("@function.builtin", "Function")
link("@function", "Function")
link("@keyword.conditional", "Conditional")
link("@keyword", "DarkBlue")
link("@keyword.exception", "Conditional")
link("@keyword.export", "Conditional")
link("@keyword.import", "Conditional")
link("@keyword.return", "Conditional")
link("@local.definition.parameter", "Red")
link("@method", "Function")
link("@module.builtin", "Constant")
link("@markup.heading", "Red")
link("@punctuation.special", "White")
link("@punctuation", "White")
link("@string.escape", "String.special")
link("@string.regexp", "Red")
link("@string.special", "String.special")
link("@string", "String")
link("@tag.builtin", "Red")
link("@tag", "Red")
link("@type.builtin", "Type")
link("@type", "Type")
link("@variable.builtin", "Type")
link("@variable.parameter.builtin", "Green")
link("@variable.parameter", "Green")
link("@variable", "Variable")
