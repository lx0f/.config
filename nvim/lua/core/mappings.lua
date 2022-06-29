local mappings = { n = {}, v = {}, t = {}, [""] = {} }

mappings[""]["Space"] = "<Nop>"

-- Normal --
-- Standard Operations
mappings.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
mappings.n["<leader>q"] = { "<cmd>q<cr>", desc = "Quit" }
mappings.n["<leader>h"] = { "<cmd>nohlsearch<cr>", desc = "No Highlight" }
mappings.n["<leader>fn"] = { "<cmd>enew<cr>", desc = "New File" }
mappings.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" }
mappings.n["<C-q>"] = { "<cmd>q!<cr>", desc = "Force quit" }
mappings.n["Q"] = "<Nop>"

-- NeoTree
mappings.n["<leader>e"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" }
mappings.n["<leader>o"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" }

-- Packer
mappings.n["<leader>pc"] = { "<cmd>PackerCompile<cr>", desc = "Packer Compile" }
mappings.n["<leader>pi"] = { "<cmd>PackerInstall<cr>", desc = "Packer Install" }
mappings.n["<leader>ps"] = { "<cmd>PackerSync<cr>", desc = "Packer Sync" }
mappings.n["<leader>pS"] = { "<cmd>PackerStatus<cr>", desc = "Packer Status" }
mappings.n["<leader>pu"] = { "<cmd>PackerUpdate<cr>", desc = "Packer Update" }

-- Bufdelete
mappings.n["<leader>c"] = { "<cmd>Bdelete<cr>", desc = "Close window" }

-- Navigate buffers
mappings.n["<S-l>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer tab" }
mappings.n["<S-h>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer tab" }
mappings.n[">b"] = { "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer tab right" }
mappings.n["<b"] = { "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer tab left" }

-- Telescope
mappings.n["<leader>fw"] = {
    function()
      require("telescope.builtin").live_grep()
    end,
    desc = "Search words",
  }
mappings.n["<leader>fW"] = {
  function()
    require("telescope.builtin").live_grep {
      additional_args = function(args)
        return vim.list_extend(args, { "--hidden", "--no-ignore" })
      end,
    }
  end,
  desc = "Search words in all files",
}
mappings.n["<leader>gt"] = {
  function()
    require("telescope.builtin").git_status()
  end,
  desc = "Git status",
}
mappings.n["<leader>gb"] = {
  function()
    require("telescope.builtin").git_branches()
  end,
  desc = "Git branches",
}
mappings.n["<leader>gc"] = {
  function()
    require("telescope.builtin").git_commits()
  end,
  desc = "Git commits",
}
mappings.n["<leader>ff"] = {
  function()
    require("telescope.builtin").find_files()
  end,
  desc = "Search files",
}
mappings.n["<leader>fF"] = {
  function()
    require("telescope.builtin").find_files { hidden = true, no_ignore = true }
  end,
  desc = "Search all files",
}
mappings.n["<leader>fb"] = {
  function()
    require("telescope.builtin").buffers()
  end,
  desc = "Search buffers",
}
mappings.n["<leader>fh"] = {
  function()
    require("telescope.builtin").help_tags()
  end,
  desc = "Search help",
}
mappings.n["<leader>fm"] = {
  function()
    require("telescope.builtin").marks()
  end,
  desc = "Search marks",
}
mappings.n["<leader>fo"] = {
  function()
    require("telescope.builtin").oldfiles()
  end,
  desc = "Search history",
}
mappings.n["<leader>sb"] = {
  function()
    require("telescope.builtin").git_branches()
  end,
  desc = "Git branches",
}
mappings.n["<leader>sh"] = {
  function()
    require("telescope.builtin").help_tags()
  end,
  desc = "Search help",
}
mappings.n["<leader>sm"] = {
  function()
    require("telescope.builtin").man_pages()
  end,
  desc = "Search man",
}
mappings.n["<leader>sn"] = {
  function()
    require("telescope").extensions.notify.notify()
  end,
  desc = "Search notifications",
}
mappings.n["<leader>sr"] = {
  function()
    require("telescope.builtin").registers()
  end,
  desc = "Search registers",
}
mappings.n["<leader>sk"] = {
  function()
    require("telescope.builtin").keymappings()
  end,
  desc = "Search keymappings",
}
mappings.n["<leader>sc"] = {
  function()
    require("telescope.builtin").commands()
  end,
  desc = "Search commands",
}
mappings.n["<leader>ls"] = {
  function()
    local aerial_avail, _ = pcall(require, "aerial")
    if aerial_avail then
      require("telescope").extensions.aerial.aerial()
    else
      require("telescope.builtin").lsp_document_symbols()
    end
  end,
  desc = "Search symbols",
}
mappings.n["<leader>lR"] = {
  function()
    require("telescope.builtin").lsp_references()
  end,
  desc = "Search references",
}
mappings.n["<leader>lD"] = {
  function()
    require("telescope.builtin").diagnostics()
  end,
  desc = "Search diagnostics",
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
