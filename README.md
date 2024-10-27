<p align="center">
  <h1 align="center">repeatable.nvim</h2>
</p>

<p align="center">
    > Makes custom keymaps repeatable
</p>


## 📋 Installation

<div align="center">
<table>
<thead>
<tr>
<th>Package manager</th>
<th>Snippet</th>
</tr>
</thead>
<tbody>
<tr>
<td>

[wbthomason/packer.nvim](https://github.com/wbthomason/packer.nvim)

</td>
<td>

```lua
-- stable version
use {"repeatable.nvim", tag = "*" }
-- dev version
use {"repeatable.nvim"}
```

</td>
</tr>
<tr>
<td>

[junegunn/vim-plug](https://github.com/junegunn/vim-plug)

</td>
<td>

```lua
-- stable version
Plug "repeatable.nvim", { "tag": "*" }
-- dev version
Plug "repeatable.nvim"
```

</td>
</tr>
<tr>
<td>

[folke/lazy.nvim](https://github.com/folke/lazy.nvim)

</td>
<td>

```lua
-- stable version
require("lazy").setup({{"repeatable.nvim", version = "*"}})
-- dev version
require("lazy").setup({"repeatable.nvim"})
```

</td>
</tr>
</tbody>
</table>
</div>


## ⚙ Configuration

> **Note**: The options are also available in Neovim by calling `:h repeatable.options`

```lua
require("repeatable").setup({
    opts = {
      -- define the functions you want to be repeatable
      functions = {
        next_git_hunk = function()
          require('gitsigns').nav_hunk('next', { greedy = true })
        end
        prev_hunk = function()
          gitsigns.nav_hunk('prev', { greedy = true })
        end,
  ﻿﻿      next_diagnostic = function()
          vim.diagnostic.goto_next({
            float = false,
          })
        end,
  
        prev_diagnostic = function()
          vim.diagnostic.goto_prev({
            float = false,
          })
        end,
      }
    }
})

-- then set your keymaps

local r = require('repeatable')
vim.keymap.set({ 'n' }, '<leader>xn', function()
  r.call('next_diagnostic')
end, { desc = 'Next diagnostic' })

vim.keymap.set({ 'n' }, '<leader>xp', r.keymap('prev_diagnostic'), { desc = 'Previous diagnostic' })
-- r.k(function_name) will also work as keymap
```



## ⌨ Contributing

PRs and issues are always welcome. Make sure to provide as much context as possible when opening one.
