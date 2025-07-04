local keymap = vim.keymap.set

-- Based on https://www.reddit.com/r/neovim/comments/3fricd/comment/ctrru3b
keymap({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap("n", "<leader>y", '"+yg_', { desc = "Yank to clipboard" })
keymap({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
keymap({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from clipboard" })

--

-- Toggle smooth cursor (key: <F6>)
keymap("n", "<F6>", function()
  local ok, smear = pcall(require, "smear_cursor")
  if ok then
    smear.enabled = not smear.enabled
    vim.notify("Smooth Cursor " .. (smear.enabled and "Enabled" or "Disabled"))
  else
    vim.notify("smear_cursor.nvim not loaded", vim.log.levels.ERROR)
  end
end, { desc = "Toggle Smooth Cursor" })
