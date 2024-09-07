local keymap = vim.keymap.set

-- Based on https://www.reddit.com/r/neovim/comments/3fricd/comment/ctrru3b
keymap({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap("n", "<leader>y", '"+yg_', { desc = "Yank to clipboard" })
keymap({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
keymap({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from clipboard" })
