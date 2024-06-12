local util = require "formatter.util"

local function biome_format()
  if vim.api.nvim_buf_line_count(0) < 1 then
    return {}
  end

  return {
    exe = "npx @biomejs/biome format",
    args = { '--stdin-file-path', util.escape_path(util.get_current_buffer_file_path()) },
    stdin = true,
  }
end

require("formatter").setup({
  logging = true,
  filetype = {
    html = { biome_format },
    typescriptreact = { biome_format },
    typescript = { biome_format },
    javascript = { biome_format },
    javascriptreact = { biome_format },
    markdown = { biome_format },
    json = { biome_format },
    jsonc = { biome_format },
    css = { biome_format },
    scss = { biome_format },
    less = { biome_format },
    vue = { biome_format },
  },
})
