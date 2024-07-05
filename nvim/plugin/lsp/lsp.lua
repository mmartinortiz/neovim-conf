local capabilities = require('cmp_nvim_lsp').default_capabilities()
local navic = require('nvim-navic')
local on_attach = function(client, bufnr)
  if client.name == 'ruff_lsp' then
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end

  if client.server_capabilities['documentSymbolProvider'] then
    navic.attach(client, bufnr)
  end
end

require("lsp-format").setup {}

local prettier = require('efmls-configs.formatters.prettier_d')
local taplo = require('efmls-configs.formatters.taplo')

require('lspconfig').nil_ls.setup {
  autostart = true,
  capabilities = capabilities,
  cmd = { 'nil' },
  settings = {
    ['nil'] = {
      formatting = {
        command = { 'alejandra', '--quiet' },
      },
    },
  },
}
require('lspconfig').clangd.setup {
  autostart = true,
  capabilities = capabilities,
}
require('lspconfig').gopls.setup {
  autostart = true,
  capabilities = capabilities,
}
require('lspconfig').tsserver.setup {
  autostart = true,
  capabilities = capabilities,
}
require('lspconfig').lua_ls.setup {
  autostart = true,
  capabilities = capabilities,
}
require('lspconfig').pyright.setup {
  autostart = true,
  capabilities = capabilities,
  on_attach = on_attach,
}
-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings

require('lspconfig').ruff_lsp.setup {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    },
  },
  on_attach = on_attach,
}

require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["../path/relative/to/file.yml"] = "/.github/workflows/*",
        ["/path/from/root/of/project"] = "/.github/workflows/*",
      },
    },
  }
}


require("lspconfig").efm.setup {
  on_attach = require("lsp-format").on_attach,
  init_options = { documentFormatting = true },
  settings = {
    languages = {
      json = { prettier },
      markdown = { prettier },
      sql = { prettier },
      toml = { taplo },
      typescript = { prettier },
      xml = { prettier },
      yaml = { prettier },
    },
  },
}
