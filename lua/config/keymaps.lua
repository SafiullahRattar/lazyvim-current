-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>m", "a{}<Esc>i<CR><Esc>O", { desc = "Curly brace around" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Code Companion Chat" })
vim.keymap.set("n", "<leader>ai", "<cmd>CodeCompanionActions<cr>", { desc = "Code Companion Actions" })

local function swap_path_line()
  -- Path mappings (without requiring the exact path with trailing slash)
  local paths = {
    ["/home/safi/safihasanfaraz%-share"] = "/home/hassan/sharefiles-text",
    ["/home/hassan/sharefiles%-text"] = "/home/safi/safihasanfaraz-share",
  }

  -- Get the current line
  local line = vim.api.nvim_get_current_line()
  local new_line = line

  -- Try each path mapping
  for from_path, to_path in pairs(paths) do
    if line:find(from_path) then
      new_line = line:gsub(from_path, to_path)
      break
    end
  end

  -- Update the current line if a replacement was made
  if new_line ~= line then
    vim.api.nvim_set_current_line(new_line)
    print("Path swapped!")
  else
    print("No matching path found on this line.")
  end
end

local function swap_paths_file()
  -- Path mappings (without requiring the exact path with trailing slash)
  local paths = {
    ["/home/safi/safihasanfaraz%-share"] = "/home/hassan/sharefiles-text",
    ["/home/hassan/sharefiles%-text"] = "/home/safi/safihasanfaraz-share",
  }

  -- Get all lines in the buffer
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local changes_made = false

  for i, line in ipairs(lines) do
    local new_line = line

    -- Try each path mapping on this line
    for from_path, to_path in pairs(paths) do
      if line:find(from_path) then
        new_line = line:gsub(from_path, to_path)
        changes_made = true
        break
      end
    end

    -- Update the line if changes were made
    if new_line ~= line then
      lines[i] = new_line
    end
  end

  -- Update the buffer with modified lines
  if changes_made then
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    print("All paths in file swapped!")
  else
    print("No matching paths found in file.")
  end
end

-- Add your keymaps here
vim.keymap.set("n", "<leader>an", swap_path_line, { noremap = true, desc = "Swap file path on current line" })
vim.keymap.set("n", "<leader>aN", swap_paths_file, { noremap = true, desc = "Swap all file paths in the entire file" })
