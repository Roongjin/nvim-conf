return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      sql = { "sql-formatter" },
    },
    formatters = {
      ["sql-formatter"] = {
        command = "sql-formatter",
        args = { "--config", '{"language":"postgresql","tabWidth":2,"keywordCase":"upper","linesBetweenQueries":2}' },
      },
    },
  },
}
