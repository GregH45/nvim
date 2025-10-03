local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local colors = {
  RainbowRed    = "#E06C75",
  RainbowYellow = "#E5C07B",
  RainbowBlue   = "#61AFEF",
  RainbowOrange = "#D19A66",
  RainbowGreen  = "#98C379",
  RainbowViolet = "#C678DD",
  RainbowCyan   = "#56B6C2",
}

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { highlight = highlight },
    scope = { enabled = true, highlight = highlight },
  },
  config = function(_, opts)
    -- 1. Define the highlight groups *before* setup
    for name, hex in pairs(colors) do
      vim.api.nvim_set_hl(0, name, { fg = hex })
    end

    -- 2. Now call ibl.setup
    local ibl_ok, ibl = pcall(require, "ibl")
    if ibl_ok then
      ibl.setup(opts)
    end

    -- 3. Register hook so highlights are re-applied on colorscheme changes
    local hooks_ok, hooks = pcall(require, "ibl.hooks")
    if hooks_ok then
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        for name, hex in pairs(colors) do
          vim.api.nvim_set_hl(0, name, { fg = hex })
        end
      end)
    end
  end,
}

