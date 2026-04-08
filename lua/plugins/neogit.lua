return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        local prefix = "<Leader>g"
        maps.n[prefix .. "g"] = { "<Cmd>Neogit<CR>", desc = "Open Neogit Tab Page" }
        maps.n[prefix .. "f"] = { "<Cmd>Neogit kind=floating<CR>", desc = "Open Neogit Float" }
        maps.n[prefix .. "c"] = { "<Cmd>Neogit commit<CR>", desc = "Open Neogit Commit Page" }
        maps.n[prefix .. "d"] = { "<Cmd>Neogit diff<CR>", desc = "Open Neogit Diff Page" }
        maps.n[prefix .. "p"] = { ":Neogit cwd=", desc = "Open Neogit Override CWD" }
        maps.n[prefix .. "k"] = { ":Neogit kind=", desc = "Open Neogit Override Kind" }

        -- Gitsigns defaults (disable or remap as needed)
        -- maps.n[prefix .. "l"] = { function() require("gitsigns").blame_line() end, desc = "View Git blame" }
        -- maps.n[prefix .. "L"] = { function() require("gitsigns").blame_line { full = true } end, desc = "View full Git blame" }
        maps.n[prefix .. "h"] = { function() require("gitsigns").preview_hunk_inline() end, desc = "Preview Git hunk" }
        -- maps.n[prefix .. "r"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" }
        -- maps.n[prefix .. "R"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset Git buffer" }
        -- maps.n[prefix .. "s"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage Git hunk" }
        -- maps.n[prefix .. "S"] = { function() require("gitsigns").stage_buffer() end, desc = "Stage Git buffer" }
        maps.n[prefix .. "D"] = { function() require("gitsigns").diffthis() end, desc = "View Git diff" }

        -- Snacks picker defaults (disable or remap as needed)
        -- maps.n[prefix .. "b"] = { function() require("snacks").picker.git_branches() end, desc = "Git branches" }
        maps.n[prefix .. "C"] = { function() require("snacks").picker.git_log() end, desc = "Git commits (repo)" }
        maps.n[prefix .. "c"] = {
          function() require("snacks").picker.git_log { current_file = true, follow = true } end,
          desc = "Git commits (current file)",
        }
        -- maps.n[prefix .. "t"] = { function() require("snacks").picker.git_status() end, desc = "Git status" }
        -- maps.n[prefix .. "T"] = { function() require("snacks").picker.git_stash() end, desc = "Git stash" }
        -- maps.n[prefix .. "o"] = { function() require("snacks").gitbrowse() end, desc = "Git browse (open)" }

        -- Toggleterm defaults (disable or remap as needed)
        -- maps.n[prefix .. "g"] = { function() require("astrocore").toggle_term_cmd { cmd = "lazygit", direction = "float" } end, desc = "ToggleTerm lazygit" }
      end,
    },
  },
  specs = {
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { neogit = true } },
    },
  },
  event = "User AstroGitFile",
  opts = function(_, opts)
    local utils = require "astrocore"
    local disable_builtin_notifications = utils.is_available "nvim-notify" or utils.is_available "noice.nvim"
    if utils.is_available "snacks.nvim" then
      local snacks_notifier = utils.plugin_opts("snacks.nvim").notifier
      if snacks_notifier and vim.tbl_get(snacks_notifier, "enabled") ~= false then
        disable_builtin_notifications = true
      end
    end

    return utils.extend_tbl(opts, {
      disable_builtin_notifications = disable_builtin_notifications,
      disable_signs = true,
      telescope_sorter = function()
        if utils.is_available "telescope-fzf-native.nvim" then
          return require("telescope").extensions.fzf.native_fzf_sorter()
        end
      end,
      integrations = {
        telescope = utils.is_available "telescope.nvim",
        diffview = utils.is_available "diffview.nvim",
        fzf_lua = utils.is_available "fzf-lua",
        mini_pick = utils.is_available "mini.pick",
        snacks = utils.is_available "snacks.nvim",
      },
    })
  end,
}
