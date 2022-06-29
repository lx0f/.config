local M = {}

local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "lsp_document_highlight",
      pattern = "<buffer>",
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      pattern = "<buffer>",
      callback = vim.lsp.buf.clear_references,
    })
  end
end

M.on_attach = function(client, bufnr)

    local mappings = {
      n = {
        ["K"] = {
          function()
            vim.lsp.buf.hover()
          end,
          desc = "Hover symbol details",
          buffer = bufnr,
        },
        ["<leader>la"] = {
          function()
            vim.lsp.buf.code_action()
          end,
          desc = "LSP code action",
          buffer = bufnr,
        },
        ["<leader>lf"] = {
          function()
            vim.lsp.buf.formatting_sync()
          end,
          desc = "Format code",
          buffer = bufnr,
        },
        ["<leader>lh"] = {
          function()
            vim.lsp.buf.signature_help()
          end,
          desc = "Signature help",
          buffer = bufnr,
        },
        ["<leader>lr"] = {
          function()
            vim.lsp.buf.rename()
          end,
          desc = "Rename current symbol",
          buffer = bufnr,
        },
        ["gD"] = {
          function()
            vim.lsp.buf.declaration()
          end,
          desc = "Declaration of current symbol",
          buffer = bufnr,
        },
        ["gI"] = {
          function()
            vim.lsp.buf.implementation()
          end,
          desc = "Implementation of current symbol",
          buffer = bufnr,
        },
        ["gd"] = {
          function()
            vim.lsp.buf.definition()
          end,
          desc = "Show the definition of current symbol",
          buffer = bufnr,
        },
        ["gr"] = {
          function()
            vim.lsp.buf.references()
          end,
          desc = "References of current symbol",
          buffer = bufnr,
        },
        ["<leader>ld"] = {
          function()
            vim.diagnostic.open_float()
          end,
          desc = "Hover diagnostics",
          buffer = bufnr,
        },
        ["[d"] = {
          function()
            vim.diagnostic.goto_prev()
          end,
          desc = "Previous diagnostic",
          buffer = bufnr,
        },
        ["]d"] = {
          function()
            vim.diagnostic.goto_next()
          end,
          desc = "Next diagnostic",
          buffer = bufnr,
        },
        ["gl"] = {
          function()
            vim.diagnostic.open_float()
          end,
          desc = "Hover diagnostics",
          buffer = bufnr,
        },
      },
    }

    for mode, maps in pairs(mappings) do
        for keymap, options in pairs(maps) do
          if options then
            local cmd = options
            if type(options) == "table" then
            cmd = options[1]
            options[1] = nil
            else
            options = {}
            end
            vim.keymap.set(mode, keymap, cmd, vim.tbl_deep_extend("force", options, base or {}))
          end
        end
    end 

    vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
      vim.lsp.buf.formatting()
    end, { desc = "Format file with LSP" })

    lsp_highlight_document(client)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.preselectSupport = true
M.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
M.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
M.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
M.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
M.capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}


return M
