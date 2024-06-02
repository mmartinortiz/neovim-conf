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
  position = 'center',
  hl = 'Type',
  -- wrap = "overflow";
}

-- Set menu
dashboard.section.buttons.val = {
  -- dashboard.button("SPC j", "󰈚   Restore Session", ":SessionRestore<cr>"),
  dashboard.button('n', '   New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('f', '   Open file', ':Telescope find_files<CR>'),
  dashboard.button('g', '󰱼   Find word', ':Telescope live_grep<CR>'),
  dashboard.button('r', '   Recent', ':Telescope oldfiles<CR>'),
  dashboard.button('q', '   Quit NVIM', ':qa<CR>'),
}

dashboard.opts.opts.noautocmd = true
require('alpha').setup(dashboard.opts)
