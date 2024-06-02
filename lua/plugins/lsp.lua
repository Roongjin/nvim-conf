require("lazyvim.util").lsp.on_attach(function(client, buffer)
  local filetype = vim.api.nvim_get_option_value("filetype", { buf = buffer })

  if client.name == "yamlls" then
    if filetype == "helm" then
      vim.print("Helm file opened, stopping yamlls server...")

      vim.schedule(function()
        vim.cmd("LspStop ++force yamlls")
      end)
    end
  end

  if client.name == "tailwindcss" then
    -- Tailwind crashes when opening HTML files and hangs Neovim.
    -- So we need to stop the server when opening HTML files.
    if filetype == "html" then
      vim.print("HTML file opened, stopping tailwindcss server to prevent crash...")

      vim.schedule(function()
        vim.cmd("LspStop ++force tailwindcss")
      end)
    end
  end
end)

return {
  { "towolf/vim-helm", ft = "helm" },
  {
    "nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {},
        helm_ls = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "helm-ls",
      })
    end,
  },
}
