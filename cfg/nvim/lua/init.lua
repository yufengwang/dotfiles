local function set_buf_map(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end

local function set_buf_opt(...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end

local function lsp_on_attach(client, bufnr)
  require('completion').on_attach()
  local opts = { noremap=true, silent=true }
  set_buf_map('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  set_buf_map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  set_buf_map('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  set_buf_map('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  set_buf_map('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  set_buf_map('n', '<leader>gH', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  set_buf_map('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  set_buf_map('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  set_buf_map('n', '<leader>ge', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  set_buf_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  set_buf_map("n", "<leader>rf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  set_buf_map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  set_buf_map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  set_buf_opt('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

require('lspconfig').rust_analyzer.setup { on_attach = lsp_on_attach }

local ts_actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = ts_actions.close,
        ["<c-j>"] = ts_actions.move_selection_next,
        ["<c-k>"] = ts_actions.move_selection_previous,
      },
    },
    prompt_position = "top",
    sorting_strategy = "ascending",
  }
}
