return {
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            on_attach = function(bufnr)
                local gitsigns = require 'gitsigns'

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']g', function()
                    if vim.wo.diff then
                        vim.cmd.normal { ']c', bang = true }
                    else
                        gitsigns.nav_hunk 'next'
                    end
                end, { desc = 'Gitsigns: Jump to next git hunk' })

                map('n', '[g', function()
                    if vim.wo.diff then
                        vim.cmd.normal { '[c', bang = true }
                    else
                        gitsigns.nav_hunk 'prev'
                    end
                end, { desc = 'Gitsigns: Jump to previous git hunk' })

                -- Actions
                -- Visual mode
                map('v', '<leader>gs', function()
                    gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
                end, { desc = 'Gitsigns: Stage selected git hunk' })
                map('v', '<leader>gr', function()
                    gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
                end, { desc = 'Gitsigns: Reset selected git hunk' })

                -- Normal mode
                map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Gitsigns: Stage git hunk' })
                map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Gitsigns: Reset git hunk' })
                map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Gitsigns: Stage entire buffer' })
                map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'Gitsigns: Undo staged hunk' })
                map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Gitsigns: Reset entire buffer' })
                map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Gitsigns: Preview git hunk' })
                map('n', '<leader>gb', gitsigns.blame_line, { desc = 'Gitsigns: Show blame for current line' })
                map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Gitsigns: Show diff against index' })
                map('n', '<leader>gD', function()
                    gitsigns.diffthis '@'
                end, { desc = 'Gitsigns: Show diff against last commit' })

                -- Toggles
                map('n', '<leader>gtb', gitsigns.toggle_current_line_blame,
                    { desc = 'Gitsigns: Toggle blame for current line' })
                map('n', '<leader>gtd', gitsigns.toggle_deleted, { desc = 'Gitsigns: Toggle showing deleted lines' })
            end,
        },
    },
}
