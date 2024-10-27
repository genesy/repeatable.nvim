-- You can use this loaded variable to enable conditional parts of your plugin.
if _G.RepeatableLoaded then
    return
end

_G.RepeatableLoaded = true

-- Useful if you want your plugin to be compatible with older (<0.7) neovim versions
if vim.fn.has("nvim-0.7") == 0 then
    vim.cmd("command! Repeatable lua require('repeatable').toggle()")
else
    vim.api.nvim_create_user_command("Repeatable", function()
        require("repeatable").toggle()
    end, {})
end
