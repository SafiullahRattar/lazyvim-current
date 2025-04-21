-- oil.lua

-- Reads an entire file given its path.
local function read_file(filepath)
  local file = io.open(filepath, "r")
  if file then
    local content = file:read("*a")
    file:close()
    return content
  end
  return nil
end

-- Copies the contents of files listed in the selected lines.
-- Expects start and end line numbers.
local function copy_selected_files_contents(start_line, end_line)
  local oil = require("oil")
  local oil_dir = oil.get_current_dir(0)

  -- Fallback to current buffer's directory if Oil's directory isn't available.
  if not oil_dir or oil_dir == "" then
    oil_dir = vim.fn.expand("%:p:h") .. "/"
  end

  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  if not lines or #lines == 0 then
    print("No files selected. Try again.")
    return
  end

  local output = {}
  for _, line in ipairs(lines) do
    local filename = line:match("[^%s]+$")
    if filename then
      local filepath = oil_dir .. filename
      local content = read_file(filepath)
      if content and #content > 0 then
        table.insert(output, "// " .. filename .. "\n" .. content)
      end
    end
  end

  if #output > 0 then
    local final_content = table.concat(output, "\n\n")
    vim.fn.setreg("+", final_content)
    print("Copied file contents to clipboard")
  else
    print("No valid files found. Try again.")
  end
end

-- Create a user command that accepts a range.
vim.api.nvim_create_user_command("CopyOilContents", function(opts)
  copy_selected_files_contents(opts.line1, opts.line2)
end, { range = true })

-- Visual mode mapping using mode "x" (for visual selections).
vim.keymap.set("x", "<leader>cy", ":CopyOilContents<CR>", { desc = "Copy selected file contents" })
-- Normal mode mapping to open Oil (parent directory)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    skip_confirm_for_simple_edits = true,
    watch_for_changes = true,
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
