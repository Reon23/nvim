return {
  "echasnovski/mini.indentscope",
  version = false,
  config = function()
    require("mini.indentscope").setup {
      symbol = "¦",
      options = {
        try_as_border = true,
      },
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      },
    }
  end,
}
