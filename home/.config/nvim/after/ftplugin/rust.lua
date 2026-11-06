local bufnr = vim.api.nvim_get_current_buf()
local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set(
  'n',
  '<space>',
  function()
    vim.cmd.RustLsp('codeAction')
  end,
  bufopts
)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
