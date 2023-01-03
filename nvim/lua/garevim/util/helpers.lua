local M = {}

function M.safe_require(mod_str)
    local valid, mod = pcall(require, mod_str)
    if not valid then
        print("module:".."'"..mod_str.."'","did not load")
    end
    return valid, mod
end
return M
