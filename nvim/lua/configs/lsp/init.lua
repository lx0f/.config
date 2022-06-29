local status_ok, lspconfig = pcall(require, "lspconfig")
if status_ok  then
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end
  vim.diagnostic.config({
    virtual_text = true,
    signs = { active = signs },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

  local lsp = require('configs.lsp.handlers')

  local lsp_installer = require('nvim-lsp-installer')
  local servers = {}
  for _, server in ipairs(lsp_installer.get_installed_servers()) do
      table.insert(servers, server.name)
  end
  for _, server in ipairs(servers) do
      local settings_ok, settings = pcall(require, 'configs.lsp.server-settings.' .. server)
      local opts = {
          on_attach = lsp.on_attach,
          capabilities = lsp.capabilities
      }
      if server == 'pyright' then
        opts = vim.tbl_deep_extend('force', opts, settings)
        lspconfig[server].setup(opts)
      else
        lspconfig[server].setup(opts)
      end
  end
end

