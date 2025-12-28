return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      indent   = { enabled = true },
      scroll   = { enabled = true },
      gh       = { enabled = true },
      terminal = { enabled = true },

      styles = {
        notification = {
          wo = { wrap = true },
        },

        zen = {
          enter = true,
          fixbuf = false,
          minimal = false,
          width = 110,
          height = 0,
          backdrop = { transparent = true, blend = 35 },
          keys = { q = false },
          zindex = 40,
          wo = { winhighlight = "NormalFloat:Normal" },
          w = { snacks_main = true },
        },
      },

      notifier = {
        enabled = true,
        timeout = 3000,
      },

      lazygit = {
        enabled = true,
        configure = true,
        config = {
          os = { editPreset = "nvim-remote" },
          gui = {
            nerdFontsVersion = "3",
          },
        },
        win = { style = "Lazygit" },
        theme = {
          [241]                      = { fg = "Special" },
          activeBorderColor          = { fg = "MatchParen", bold = true },
          cherryPickedCommitBgColor  = { fg = "Identifier" },
          cherryPickedCommitFgColor  = { fg = "Function" },
          defaultFgColor             = { fg = "Normal" },
          inactiveBorderColor        = { fg = "FloatBorder" },
          optionsTextColor           = { fg = "Function" },
          searchingActiveBorderColor = { fg = "MatchParen", bold = true },
          selectedLineBgColor        = { bg = "Visual" },
          unstagedChangesColor       = { fg = "DiagnosticError" },
        },
      },

      zen = {
        enabled = true,
        ---@class snacks.zen.Config
        ---@type table<string, boolean>
        toggles = {
          dim = true,
          git_signs = false,
          mini_diff_signs = false,
        },
        center = true,
        show = {
          statusline = false,
          tabline = false,
        },
        ---@type snacks.win.Config
        win = {
          style = "zen",
        },
        ---@param win snacks.win
        on_open = function(win) end,
        ---@param win snacks.win
        on_close = function(win) end,
        ---@type snacks.zen.Config
        zoom = {
          toggles = {},
          center = false,
          show = {
            statusline = true,
            tabline = true,
            win = {
              backdrop = false,
              width = 0,
            },
          },
        },
      },
    },

    keys = {
      -- notifications
      -- git and github
      { "<leader>gp", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "Github Pull Requests" },
      { "<leader>gl", function() Snacks.lazygit()                       end, desc = "LazyGit" },
      -- terminal
      { "<leader>tt", function() Snacks.terminal()                      end, desc = "Toggle terminal", },
      -- other
      { "<leader>z",  function() Snacks.zen()                           end, desc = "Toggle Zen mode", },
      { "<leader>Z",  function() Snacks.zen.zoom()                      end, desc = "Toggle Zoom" },
    },
  },
}
