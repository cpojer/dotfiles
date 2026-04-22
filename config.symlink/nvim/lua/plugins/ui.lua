return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree filesystem toggle left<cr>", desc = "Toggle file tree" },
      { "<leader>o", "<cmd>Neotree reveal left<cr>", desc = "Reveal current file" },
    },
    opts = {
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        width = 34,
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      {
        "<C-p>",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        mode = "n",
        desc = "Find files",
      },
      {
        "<D-p>",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        mode = "n",
        desc = "Find files",
      },
      {
        "<leader>p",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "Find files",
      },
      {
        "<C-p>",
        "<Esc><cmd>Telescope find_files hidden=true<cr>",
        mode = "i",
        desc = "Find files",
      },
      {
        "<D-p>",
        "<Esc><cmd>Telescope find_files hidden=true<cr>",
        mode = "i",
        desc = "Find files",
      },
      {
        "<lt>D-p>",
        "<Esc><cmd>Telescope find_files hidden=true<cr>",
        mode = "i",
        desc = "Find files",
      },
      {
        "<leader>f",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Search in files",
      },
      {
        "<leader>b",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Search open buffers",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(opts)
      pcall(telescope.load_extension, "fzf")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous tab" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next tab" },
      { "<leader>x", "<cmd>bdelete<cr>", desc = "Close tab" },
    },
    opts = {
      options = {
        mode = "buffers",
        always_show_bufferline = true,
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
            text = "Files",
            text_align = "left",
            separator = true,
          },
        },
      },
    },
  },
}
