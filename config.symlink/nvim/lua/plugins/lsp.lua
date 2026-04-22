return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      formatters = {
        oxfmt = {
          command = "oxfmt",
          args = { "--stdin-filepath", "$FILENAME" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        css = { "oxfmt" },
        graphql = { "oxfmt" },
        html = { "oxfmt" },
        javascript = { "oxfmt" },
        javascriptreact = { "oxfmt" },
        json = { "oxfmt" },
        jsonc = { "oxfmt" },
        markdown = { "oxfmt" },
        mdx = { "oxfmt" },
        scss = { "oxfmt" },
        toml = { "oxfmt" },
        typescript = { "oxfmt" },
        typescriptreact = { "oxfmt" },
        vue = { "oxfmt" },
        yaml = { "oxfmt" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.diagnostic.config({
        underline = true,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
        virtual_text = {
          current_line = true,
          prefix = "●",
          spacing = 2,
        },
        float = {
          border = "rounded",
          source = "if_many",
        },
      })

      vim.lsp.config("oxlint", {
        root_markers = { ".oxlintrc.json", "oxlint.config.ts", ".git" },
      })
      vim.lsp.enable("oxlint")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}
