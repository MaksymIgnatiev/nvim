vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = "#808080" })
vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#006400", bg = "#00FF00" })
-- vim.api.nvim_set_hl(0, "FlashCurrent", {  bg = "#006400" })
vim.api.nvim_set_hl(0, "FlashLabel", {  bg = "#006400" })

require('flash').setup({
  highlight = {
    backdrop = true,
    groups = {
      match = "FlashMatch",
      current = "FlashCurrent",
      backdrop = "FlashBackdrop",
	  label = "FlashLabel"
    },
  },
  modes = {
    search = {
      highlight = { backdrop = true },
    },
  },
})
