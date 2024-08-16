local wk = require('which-key')
wk.setup {
  win = {
    border = 'single',
  },
}
wk.register {
  -- File Group
  { "<leader>f", group = "File"},
  { "<leader>ff", "<cmd>Telescope find_files<cr>", "Find file" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", "Open Recent file" },
  { "<leader>fn", "enew", "New file" },
  { "<leader>fw", "<cmd>Telescope live_grep<cr>", "Grep files" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", "Grep buffers" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", "Grep Help Tags" },
  { "<leader>fd", "<cmd>Telescope diagnostics<cr>", "Grep Diagnostics" },
  { "<leader>fg", "<cmd>Telescope git_files<cr>", "Grep Git Files" },

  -- Terminal Group
  { "<leader>t", group = "Terminal" },
  { "<leader>tt", "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
  { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", "Toggle Float Terminal" },

  -- LSP Group
  { "<leader>l", group = "LSP" },
  { "<leader>lr", "<cmd>vim.lsp.buf.rename()<cr>", "Rename Current Symbol" },

  -- Goto group
  { "<leader>g", group = "Goto" },
  { "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", "Goto Definition" },
  { "<leader>gI", "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation" },
  { "<leader>gr", "<cmd>Telescope lsp_references<cr>", "Goto References" },
  { "<leader>gi", "<cmd>lua vim.diagnostic.open_float()<cr>", "Hove Diagnostics" },
  { "<leader>gk", "<cmd>lua vim.lsp.buf.hover()<cr>", "Hove Symbol Details" },

  -- Various
  { "<leader>e", "<cmd>Neotree action=focus reveal toggle<cr>", "Toggle Neotree" },
  { "<S-h>", "<cmd>bprevious<cr>", "Left Buffer" },
  { "<S-l>", "<cmd>bnext<cr>", "Right Buffer" },
}

