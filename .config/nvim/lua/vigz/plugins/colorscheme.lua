-- Lazy
return {
  "olimorris/onedarkpro.nvim",
  priority = 999, -- Ensure it loads first
  config = function()
    vim.cmd("colorscheme onedark")

    local hl = vim.api.nvim_set_hl
    hl(0, "Normal", { bg = "none" })
    hl(0, "NormalFloat", { bg = "none" })
    hl(0, "SignColumn", { bg = "none" })
    hl(0, "LineNr", { bg = "none", fg = "#5eacd3" })
    hl(0, "CursorLineNr", { bg = "none", fg = "#ffcc00", bold = true })

  end
}

