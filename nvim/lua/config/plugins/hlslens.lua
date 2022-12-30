
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ───────────────────────────────────────────────── --
--   Plugin:    hlslens.nvim
--   Github:    github.com/kevinhwang91/hlslens.nvim
-- ───────────────────────────────────────────────── --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━❰ configs ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
M = {'kevinhwang91/nvim-hlslens'}

M.config = function()
    require('hlslens').setup {
        calm_down = true,
        nearest_only = true,
        nearest_float_when = 'always',
    }
        -- nearest_float_when = 'multiline',
        -- nearest_float_when = 'never',
        -- special_treatments = {
        --     ['*'] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     ['`'] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     ['/'] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     ['?'] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     ['\\'] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     ['"'] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     ["'"] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     ['`'] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     ['('] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     [')'] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     ['['] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     [']'] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     ['{'] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     ['}'] = {hl_group = 'Search', text_hl_group = 'IncSearch', text = ''},
        --     ['<'] = {hl_group'}
end
return M

