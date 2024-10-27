local log = require("repeatable.util.log")

local Repeatable = {}

--- Repeatable configuration with its default values.
---
---@type table
--- Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
Repeatable.options = {
    -- Prints useful logs about what event are triggered, and reasons actions are executed.
    debug = false,
}

---@private
local defaults = vim.deepcopy(Repeatable.options)

--- Defaults Repeatable options by merging user provided options with the default plugin values.
---
---@param options table Module config table. See |Repeatable.options|.
---
---@private
function Repeatable.defaults(options)
    Repeatable.options =
        vim.deepcopy(vim.tbl_deep_extend("keep", options or {}, defaults or {}))

    -- let your user know that they provided a wrong value, this is reported when your plugin is executed.
    assert(
        type(Repeatable.options.debug) == "boolean",
        "`debug` must be a boolean (`true` or `false`)."
    )

    return Repeatable.options
end

--- Define your repeatable setup.
---
---@param options table Module config table. See |Repeatable.options|.
---
---@usage `require("repeatable").setup()` (add `{}` with your |Repeatable.options| table)
function Repeatable.setup(options)
    Repeatable.options = Repeatable.defaults(options or {})

    log.warn_deprecation(Repeatable.options)

    return Repeatable.options
end

return Repeatable
