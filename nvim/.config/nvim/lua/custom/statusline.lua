local M = {}

local builtin = require "el.builtin"
local extensions = require "el.extensions"
local subscribe = require "el.subscribe"
local sections = require "el.sections"

vim.opt.laststatus = 3 -- Global statusline

M.setup = function()
  require("el").setup {
    generator = function()
      local segments = {}

      -- Mode indicator
      table.insert(segments, extensions.mode)
      table.insert(segments, " ")

      -- Git branch
      table.insert(
        segments,
        subscribe.buf_autocmd("el-git-branch", "BufEnter", function(win, buf)
          local branch = extensions.git_branch(win, buf)
          return branch or ""
        end)
      )

      -- Git changes
      table.insert(
        segments,
        subscribe.buf_autocmd("el-git-changes", "BufWritePost", function(win, buf)
          local changes = extensions.git_changes(win, buf)
          return changes or ""
        end)
      )

      -- Queued events from `misery.scheduler`
      table.insert(segments, function()
        local task_count = #require("misery.scheduler").tasks
        if task_count > 0 then
          return string.format(" (Queued Events: %d)", task_count)
        end
        return ""
      end)

      -- Add a separator
      table.insert(segments, sections.split)

      -- File path
      table.insert(segments, "%f")

      -- Add another separator
      table.insert(segments, sections.split)

      -- File type
      table.insert(segments, builtin.filetype)

      -- Line and column indicators
      table.insert(segments, "[")
      table.insert(segments, builtin.line_with_width(3))
      table.insert(segments, ":")
      table.insert(segments, builtin.column_with_width(2))
      table.insert(segments, "]")

      return segments
    end,
  }
end

return M
