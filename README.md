# Neovim Configuration

Personal Neovim setup using `lazy.nvim` and native Neovim LSP.

## Requirements

- Neovim 0.11+
- Git
- [ripgrep](https://github.com/BurntSushi/ripgrep) for live grep
- A Nerd Font
- Java for `ktlint`

## Plugins

- `folke/lazy.nvim` — plugin manager
- `catppuccin/nvim` — colorscheme
- `saghen/blink.cmp` — completion
- `mason-org/mason.nvim` — tool installer
- `mason-org/mason-lspconfig.nvim` — Mason/LSP integration
- `neovim/nvim-lspconfig` — LSP configurations
- `j-hui/fidget.nvim` — LSP progress
- `nvim-treesitter/nvim-treesitter` — syntax parsing
- `nvim-treesitter/nvim-treesitter-textobjects` — structural text objects
- `nvim-telescope/telescope.nvim` — file and text search
- `folke/trouble.nvim` — diagnostics list
- `stevearc/conform.nvim` — formatting
- `mbbill/undotree` — visual undo history

## Language Servers

Lua, TypeScript/JavaScript, Svelte, Kotlin, C/C++, Python, and Go.

## Formatters

Install with:

```vim
:MasonInstall stylua prettierd ktlint clang-format ruff goimports
```

`gofmt` comes with Go.

## Installation

```sh
git clone https://github.com/Stealthhy7512/neovim-config.git ~/.config/nvim
nvim
```

Lazy.nvim installs the configured plugins on first launch.
