local alpha = require('alpha')
local icons = require('icons')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                     ]],
  [[       ████ ██████           █████      ██                     ]],
  [[      ███████████             █████                             ]],
  [[      █████████ ███████████████████ ███   ███████████   ]],
  [[     █████████  ███    █████████████ █████ ██████████████   ]],
  [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
  [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
  [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
}

_Gopts = {
  position = "center",
  hl = "Type",
  -- wrap = "overflow";
}

-- Set menu
dashboard.section.buttons.val = {
  -- dashboard.button("SPC j", "󰈚   Restore Session", ":SessionRestore<cr>"),
  dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "   Find file", ":cd $HOME/dotfiles | Telescope find_files<CR>"),
  dashboard.button("g", "󰱼   Find word", ":Telescope live_grep<CR>"),
  dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("c", "   Config", ":e $MYVIMRC <CR>"),
  dashboard.button("m", "󱌣   Mason", ":Mason<CR>"),
  dashboard.button("l", "󰒲   Lazy", ":Lazy<CR>"),
  dashboard.button("u", "󰂖   Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
  dashboard.button("q", "   Quit NVIM", ":qa<CR>"),
}

dashboard.opts.opts.noautocmd = true
require("alpha").setup(dashboard.opts)

