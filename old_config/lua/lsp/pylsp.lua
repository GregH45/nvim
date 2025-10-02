return {
  pylsp = {
    plugins = {
      pycodestyle = {
        enabled = true,
        maxLineLength = 100,
      },
      pylint = { enabled = false },
      pyflakes = { enabled = true },
      yapf = { enabled = false },
      black = {
        enabled = true,
        line_length = 100,
      },
    },
  },
}