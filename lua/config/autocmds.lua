-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Abandon snippet when leave insert mode
local function leave_snippet()
  local old_mode = vim.v.event.old_mode
  local is_snippet_active = vim.snippet.active({ direction = 1 }) or vim.snippet.active({ direction = -1 })

  if old_mode == "i" and is_snippet_active then
    vim.snippet.stop()
  end
end

vim.api.nvim_create_autocmd({ "ModeChanged" }, {
  callback = leave_snippet,
})
