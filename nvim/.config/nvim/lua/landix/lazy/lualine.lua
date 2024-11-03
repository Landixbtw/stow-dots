-- https://github.com/hieulw/nvimrc/tree/lua-config/lua/plugins/ui
-- take a look at this, looks amazing
--
return {
	{
		'nvim-lualine/lualine.nvim',
		event = 'VeryLazy',
		config = function()
			-- local harpoon = require 'harpoon.mark'

			local function truncate_branch_name(branch)
				if not branch or branch == '' then
					return ''
				end

				-- Match the branch name to the specified format
				local user, team, ticket_number =
					string.match(branch, '^(%w+)/(%w+)%-(%d+)')

				-- If the branch name matches the format, display {user}/{team}-{ticket_number}, otherwise display the full branch name
				if ticket_number then
					return user .. '/' .. team .. '-' .. ticket_number
				else
					return branch
				end
			end

			-- local function harpoon_component()
			--   local total_marks = harpoon.get_length()
			--
			--   if total_marks == 0 then
			--     return ''
			--   end
			--
			--   local current_mark = '—'
			--
			--   local mark_idx = harpoon.get_current_index()
			--   if mark_idx ~= nil then
			--     current_mark = tostring(mark_idx)
			--   end
			--
			--   return string.format('󱡅 %s/%d', current_mark, total_marks)
			-- end

			require('lualine').setup {
				options = {
					-- theme = "",
					globalstatus = true,
					-- component_separators = { left = '', right = '' },
					component_separators = { left = '|', right = '' },
					section_separators = { left = '█', right = '█' },
				},
				sections = {
					lualine_b = {
						{ 'branch', icon = '\u{f418}', fmt = truncate_branch_name },
						--  🌲
						-- harpoon_component,
						'diff',
						'diagnostics',
					},
					lualine_c = {
						{ 'filename', path = 1 },
					},
					lualine_x = {
						'filetype',
					},
				},
			}
		end,
	},
}
