require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "c",
        "c_sharp",
        "cpp",
        "css",
        "dockerfile",
        "go",
        "graphql",
        "html",
        "http",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "kotlin",
        "latex",
        "lua",
        "python",
        "regex",
        "rust",
        "scss",
        "solidity",
        "todotxt",
        "tsx",
        "typescript",
        "vim",
        "vue",
        "yaml"
    },
    hightlight = {
        enable = true
    },
    indent = {
        enable = true,
        disable = {'html'}
    },
}