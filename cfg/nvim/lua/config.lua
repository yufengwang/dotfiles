--
-- status line
--
vim.g.ayuprefermirage = true
require('lualine').setup {
  options = {
    theme = 'ayu',
    icons_enabled = false,
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = { function()
      local mode_map = {
        ['c'] = ' ',
        ['V'] = 'L',
        [''] = 'B',
      }
      local code = vim.api.nvim_get_mode().mode
      local mode = mode_map[code]
      if mode == nil then
        return code
      else
        return mode
      end
    end },
  },
  extensions = {
    'fzf', 'nvim-tree', 'quickfix'
  },
}

--
-- file browser
--
require('nvim-tree').setup {
  filters = {
    dotfiles = true,
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = true,
      }
    }
  },
  sort = {
    sorter = 'case_sensitive',
  },
  view = {
    width = 25,
  },
}

--
-- syntax navigation
--
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "lua", "python", "rust" },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
}

--
-- markdown preview
--
require('glow').setup {
  border = 'rounded'
}

--
-- lsp & completion
--

local cmp = require('cmp')
cmp.setup {
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'buffer' },
  })
}
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, buf)
  local map = function(...) vim.api.nvim_buf_set_keymap(buf, ...) end
  local opt = { noremap=true, silent=true }
  map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opt)
  map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opt)
  map('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opt)
  map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opt)
  map('n', '<leader>ge', '<cmd>lua vim.diagnostic.open_float()<cr>', opt)
  map('n', '<leader>gg', '<cmd>lua vim.diagnostic.setloclist()<cr>', opt)
  map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<cr>', opt)
  map('n', '<leader>gl', '<cmd>lua vim.lsp.buf.declaration()<cr>', opt)
  map('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opt)
  map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', opt)
  map('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opt)
  map('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opt)
  map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opt)
  map("n", "<leader>rf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
end

local lsp = require('lspconfig')
lsp.basedpyright.setup {
  capabilities = capabilities,
  on_attach = lsp_attach,
}
lsp.clangd.setup {
  capabilities = capabilities,
  on_attach = lsp_attach,
}
lsp.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = lsp_attach,
}
