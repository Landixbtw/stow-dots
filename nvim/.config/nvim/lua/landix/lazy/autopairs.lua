return {
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
      -- Integrate nvim-autopairs with cmp if nvim-cmp is loaded
      local cmp_status, cmp = pcall(require, 'cmp')
      if cmp_status then
        local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end
    end,
  },
}
