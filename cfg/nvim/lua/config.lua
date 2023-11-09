local function set_buf_map(...)
  local buf_num = 0
  if bufnr ~= nil then
    buf_num = bufnr
  end
  vim.api.nvim_buf_set_keymap(buf_num, ...)
end

local function set_buf_opt(...)
  local buf_num = 0
  if bufnr ~= nil then
    buf_num = bufnr
  end
  vim.api.nvim_buf_set_option(buf_num, ...)
end

local function lsp_on_attach()
  require('completion').on_attach()
  set_buf_map('i', '<tab>', '<plug>(completion_smart_tab)', {})
  set_buf_map('i', '<s-tab>', '<plug>(completion_smart_s_tab)', {})

  local opts = { noremap=true, silent=true }
  set_buf_map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  set_buf_map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  set_buf_map('n', '<leader>gg', '<cmd>lua vim.diagnostic.setloclist()<cr>', opts)
  set_buf_map('n', '<leader>ge', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  set_buf_map('n', '<leader>gl', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  set_buf_map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  set_buf_map('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  set_buf_map('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  set_buf_map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  set_buf_map('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  set_buf_map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  set_buf_map('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  set_buf_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  set_buf_map("n", "<leader>rf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  set_buf_opt('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local lsp = require('lspconfig')
lsp.rust_analyzer.setup { on_attach = lsp_on_attach }
lsp.bashls.setup { on_attach = lsp_on_attach }
lsp.clangd.setup { on_attach = lsp_on_attach }
lsp.pylsp.setup { on_attach = lsp_on_attach }
lsp.lua_ls.setup {
  on_attach = lsp_on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim', 'bufnr'},
      }
    }
  }
}

require('nvim-tree').setup {
  renderer = {
    add_trailing = true,
    group_empty = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
      }
    }
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "lua", "python", "rust" },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
}

local lline_mode_map = {
  ['c'] = ' ',
  ['V'] = 'L',
  [''] = 'B',
}

local function lline_mode()
  local code = vim.api.nvim_get_mode().mode
  local mode = lline_mode_map[code]
  if mode == nil then
    return code
  else
    return mode
  end
end

require('lualine').setup {
  options = {
    theme = 'ayu_mirage',
    icons_enabled = false,
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {lline_mode},
  },
  extensions = {
    'fzf', 'nvim-tree', 'quickfix'
  },
}
