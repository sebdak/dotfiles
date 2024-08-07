require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    json = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    cs = { "csharpier" },
    sh = { "shellcheck" },
    toml = { "prettierd", "prettier" },
    yaml = { { "prettierd", "prettier" } },
  },
  format_on_save = {
    lsp_fallback = true,
    async = true,
    timeout_ms = 1000,
  },
})

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({
    lsp_fallback = true,
    async = true,
    timeout_ms = 1000,
  })
end)
