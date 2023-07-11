local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
  'ansiblels',
  'tsserver',
  'lua_ls',
  'eslint',
  'yamlls',
})


lsp.setup()
