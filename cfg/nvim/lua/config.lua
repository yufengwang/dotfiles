local function set_buf_map(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end

local function set_buf_opt(...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end

local function lsp_on_attach()
  require('completion').on_attach()
  set_buf_map('i', '<tab>', '<plug>(completion_smart_tab)', {})
  set_buf_map('i', '<s-tab>', '<plug>(completion_smart_s_tab)', {})

  local opts = { noremap=true, silent=true }
  set_buf_map('n', '<leader>gg', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  set_buf_map('n', '<leader>ge', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  set_buf_map('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  set_buf_map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  set_buf_map('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  set_buf_map('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  set_buf_map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  set_buf_map('n', '<leader>gH', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  set_buf_map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  set_buf_map('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  set_buf_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  set_buf_map("n", "<leader>rf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  set_buf_map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  set_buf_map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  set_buf_opt('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

require('lspconfig').rust_analyzer.setup { on_attach = lsp_on_attach }
require('lspconfig').clangd.setup { on_attach = lsp_on_attach }
require('lspconfig').sumneko_lua.setup {
  cmd = {'/usr/bin/lua-language-server'},
  on_attach = lsp_on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim', 'bufnr'},
      }
    }
  }
}

local tl_act = require('telescope.actions')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = tl_act.close,
        ["<c-j>"] = tl_act.move_selection_next,
        ["<c-k>"] = tl_act.move_selection_previous,
      },
    },
    prompt_position = "top",
    sorting_strategy = "ascending",
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
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
}
