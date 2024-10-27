local main = require("repeatable.main")
local config = require("repeatable.config")

local Repeatable = {}

--- Toggle the plugin by calling the `enable`/`disable` methods respectively.
function Repeatable.toggle()
    if _G.Repeatable.config == nil then
        _G.Repeatable.config = config.options
    end

    main.toggle("public_api_toggle")
end

--- Initializes the plugin, sets event listeners and internal state.
function Repeatable.enable(scope)
    if _G.Repeatable.config == nil then
        _G.Repeatable.config = config.options
    end

    main.toggle(scope or "public_api_enable")
end

--- Disables the plugin, clear highlight groups and autocmds, closes side buffers and resets the internal state.
function Repeatable.disable()
    main.toggle("public_api_disable")
end

-- setup Repeatable options and merge them with user provided ones.
function Repeatable.setup(opts)
    _G.Repeatable.config = config.setup(opts)
end

_G.Repeatable = Repeatable

return _G.Repeatable
