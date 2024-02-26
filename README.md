<h1 align="center">copy-as-markdown.nvim</h1>
<p align="center"><sup>Quickly copy a code selection as markdown</sup></p>

[demonstration.webm](https://github.com/kunring/copy-as-markdown.nvim/assets/25564242/bdef802b-3d48-491b-a07b-764bea4ea5ce)

![image](https://github.com/kunring/copy-as-markdown.nvim/assets/25564242/4c8b8c5b-7ffd-452b-8f72-25d149b993ae)


### Installation

- Using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
    "kunring/copy-as-markdown.nvim",
    init = function()
        require("copy-as-markdown").setup()
    end,
}
```

Using the config above no further setup is required.

### Setup

Calling the `setup()` method enables the command `:CopyAsMarkdown`.

### Configuring (optional)

The `setup()` method optionally takes in a table of configuration options.
The following is the default configuration:
```lua
require("copy-as-markdown").setup({
    -- Markdown is generated from this template.
    -- Strings "{filepath}", "{line}", "{filetype}", and "{code}"
    -- will be replaced with their corresponding data.
    template = "> *Snippet from* `{filepath}` *at* `L{line}`:\n```{filetype}\n{code}```",

    -- Output is placed on this register. The "+" register represents the system clipboard.
    register = "+",
})

-- Suggested keybinds:
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>cm", ":CopyAsMarkdown<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>cm", ":CopyAsMarkdown<CR>", opts)
```
