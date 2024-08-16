local wk = require('which-key')
wk.setup {
  win = {
    border = 'single',
  },
}
wk.register {
      { "<S-h>", "<cmd>bprevious<cr>", desc = "Left Buffer" },
    { "<S-l>", "<cmd>bnext<cr>", desc = "Right Buffer" },
    { "<leader>c", ":bdelete!<CR>", desc = "Close Buffer" },
    { "<leader>e", ":Neotree action=focus reveal toggle<cr>", desc = "Toggle Neotree" },
    { "<leader>f", group = "File" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Grep Buffers" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Grep Diagnostics" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Grep Git Files" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Grep Help Tags" },
    { "<leader>fn", "<cmd>enew<cr>", desc = "New File" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Grep Files" },
    { "<leader>g", group = "Git" },
    { "<leader>gL", "<cmd>Gitsigns blame_line {full = true}<cr>", desc = "View full Git Blame" },
    { "<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", desc = "Stage Git Buffer" },
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "View Git Diff" },
    { "<leader>gh", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Git Hunk" },
    { "<leader>gl", "<cmd>Gitsigns blame_line<cr>", desc = "View Git Blame" },
    { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Git Hunk" },
    { "<leader>gr", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Git Buffer" },
    { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Git Hunk" },
    { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Unstage Git Hunk" },
    { "<leader>l", group = "Lsp" },
    { "<leader>lI", "<cmd>NullLsInfo<cr>", desc = "Null-ls Information" },
    { "<leader>lL", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "LSP CodeLens Run" },
    { "<leader>lR", "<cmd>Telescope lsp_references<cr>", desc = "Search References" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "LSP Code Action" },
    { "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help" },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Information" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.refresh()<cr>", desc = "LSP CodeLens Refresh" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename Current Symbol" },
    { "<leader>o", "<function 1>", desc = "Neotree Focus" },
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
    { "<leader>t", group = "File" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Float Terminal" },
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    { "<leader>w", "<cmd>w<cr>", desc = "Save Buffer" },
    { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Symbol Details" },
    { "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
    { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
    { "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Hover Diagnostics" },
    { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Search References" },
    { "gy", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Definition of Current Type" },

}

