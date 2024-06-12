local util = require "formatter.util"

local function biome_format()
  if vim.api.nvim_buf_line_count(0) < 1 then
    return {}
  end

  return {
    exe = "npx biome format",
    args = { '--stdin-file-path', util.escape_path(util.get_current_buffer_file_path()) },
    stdin = true,
  }
end

local function prettier_format()
  if vim.api.nvim_buf_line_count(0) < 1 then
    return {}
  end

  return {
    exe = "npx prettier",
    args = {
      '--stdin-filepath',
      util.escape_path(util.get_current_buffer_file_path()),
    },
    stdin = true,
  }
end

require("formatter").setup({
  logging = true,
  filetype = {
    javascript = { biome_format },
    typescript = { biome_format },
    javascriptreact = { biome_format },
    typescriptreact = { biome_format },
    json = { biome_format },
    jsonc = { biome_format },
    markdown = { prettier_format },
    html = { prettier_format },
  },
})
