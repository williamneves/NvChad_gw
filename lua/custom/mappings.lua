---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["d"] = { '"_d', "delete without copy" },
    [">"] = { ">gv", "indent" },
    ["<"] = { "<gv", "unindent" },
    ["<M-j>"] = { ":m .+1<CR>==", "Move line down" },
    ["<M-k>"] = { ":m .-2<CR>==", "Move line up" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<"] = { "<gv", "unindent" },
    ["d"] = { '"_d', "delete without copy" },
    ["<M-j>"] = { ":m .+1<CR>==", "Move line down" },
    ["<M-k>"] = { ":m .-2<CR>==", "Move line up" },
  },
  i = {
    ["<M-j>"] = { "<ESC>:m .+1<CR>==", "Move line down" },
    ["<M-k>"] = { "<ESC>:m .-2<CR>==", "Move line up" },
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
 },
}

-- more keybinds!

return M
