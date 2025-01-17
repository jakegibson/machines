local M = {}
local stats = require("lazy").stats()

-- STATUSLINE --
M.statusstyle = 'fancy'

-- DASHBOARD --
local logos = setmetatable({
    TEXT = [[
██╗  ██╗ ██████╗       ██████╗  ██████╗
██║ ██╔╝██╔═══██╗      ██╔══██╗██╔═══██╗
█████╔╝ ██║   ██║█████╗██║  ██║██║   ██║
██╔═██╗ ██║   ██║╚════╝██║  ██║██║   ██║
██║  ██╗╚██████╔╝      ██████╔╝╚██████╔╝
╚═╝  ╚═╝ ╚═════╝       ╚═════╝  ╚═════╝
  ]],
    UWU = [[
      ⡆⣸⡟⣼⣯⠏⣾⣿⢸⣿⢸⣿⣿⣿⣿⣿⣿⡟⠸⠁⢹⡿⣿⣿⢻⣿⣿⣿⣿⠄
      ⡇⡟⣸⢟⣫⡅⣶⢆⡶⡆⣿⣿⣿⣿⣿⢿⣛⠃⠰⠆⠈⠁⠈⠙⠈⠻⣿⢹⡏⠄
      ⣧⣱⡷⣱⠿⠟⠛⠼⣇⠇⣿⣿⣿⣿⣿⣿⠃⣰⣿⣿⡆⠄⠄⠄⠄⠄⠉⠈⠄⠄
      ⡏⡟⢑⠃⡠⠂⠄⠄⠈⣾⢻⣿⣿⡿⡹⡳⠋⠉⠁⠉⠙⠄⢀⠄⠄⠄⠄⠄⠂⠄
      ⡇⠁⢈⢰⡇⠄⠄⡙⠂⣿⣿⣿⣿⣱⣿⡗⠄⠄⠄⢀⡀⠄⠈⢰⠄⠄⠄⠐⠄⠄
      ⠄⠄⠘⣿⣧⠴⣄⣡⢄⣿⣿⣿⣷⣿⣿⡇⢀⠄⠤⠈⠁⣠⣠⣸⢠⠄⠄⠄⠄⠄
      ⢀⠄⠄⣿⣿⣷⣬⣵⣿⣿⣿⣿⣿⣿⣿⣷⣟⢷⡶⢗⡰⣿⣿⠇⠘⠄⠄⠄⠄⠄
      ⣿⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢄⡆⠄⢀⣪⡆⠄⣿
      ]],
    UWU2 = [[
             █████████████████
         ████▌█████▌█ ████████▐▀██▀
       ▄█████ █████▌ █ ▀██████▌█▄▄▀▄
       ▌███▌█ ▐███▌▌  ▄▄ ▌█▌███▐███ ▀
      ▐ ▐██  ▄▄▐▀█   ▐▄█▀▌█▐███▐█
        ███ ▌▄█▌  ▀  ▀██  ▀██████▌
         ▀█▌▀██▀ ▄         ███▐███
          ███     ▀█▀     ▐██▐███▀▌
          ▌█▌█▄         ▄▄████▀ ▀
            █▀██▄▄▄ ▄▄▀▀▒█▀█
      ]],
  },
  {
    __index = function(logos, key)
      return logos[key]
    end,
  }
)
-- the keybinds for buttons better work
M.dashboard = {
  header = vim.split(logos.TEXT, "\n"),
  buttons = {
    { "   Find File",     "LDR f f" },
    { "󰈚   Recent Files", "LDR f g" },
    { "󰈭   Find Word",    "LDR f r" },
  },
  message = {
    "[ ━━━━━━ ❖  ━━━━━━ ]",
  },
  footer = {
    "Loaded " .. stats.count .. " plugins",
  }
}

-- COLORSCHEME --
M.colorscheme = 'everblush'
return M
