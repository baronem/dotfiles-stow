local lang_servers = {
    vimls = {},
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
            },
        },
    },
    bashls = {},
    jsonls = {},
    taplo = {},
    yamlls = {},
    lemminx = {},
    marksman = {},
    eslint = {},
    html = {
        disable_fmt = true,
    },
    tsserver = {},
    gopls = {},
    templ = {},
    pyright = {
        settings = {
            python = {
                analysis = {
                    diagnosticMode = "off",
                    typeCheckingMode = "off",
                    autoSearchPaths = true,
                    autoImportCompletions = true,
                    useLibraryCodeForTypes = true,
                },
                formatting = {
                    provider = "none",
                },
            },
        },
    },
    ruff_lsp = {
        on_attach = function(client, _)
            if client.name == "ruff_lsp" then
                -- Disable hover in favor of Pyright
                client.server_capabilities.hoverProvider = false
            end
        end,
    },
}

local formatters = {
    "stylua",
    "prettier",
}

local linters = {}

-- ######################################

local custom_format = function(opts)
    opts = opts or {}
    local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()

    local formatting_clients = {}
    local active_clients = vim.lsp.get_active_clients({ bufnr = bufnr })
    for _, client in ipairs(active_clients) do
        if not lang_servers[client.name] or not lang_servers[client.name].disable_fmt then
            formatting_clients[client.name] = true
        end
    end

    opts.bufnr = bufnr
    opts.filter = function(client)
        if client.name == "null-ls" then
            return true
        end
        return formatting_clients[client.name] ~= nil
    end

    vim.lsp.buf.format(opts)
end

return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        opts = {
            ensure_installed = vim.tbl_keys(lang_servers),
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },
    {
        "jayp0521/mason-null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        opts = function()
            local ensured = {}

            for _, k in ipairs(formatters) do
                table.insert(ensured, k)
            end

            for _, k in ipairs(linters) do
                table.insert(ensured, k)
            end

            return { ensure_installed = ensured }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            -- default_caps for completion engine integration
            local default_caps = require("cmp_nvim_lsp").default_capabilities()

            for server, conf in pairs(lang_servers) do
                if conf.capabilities == nil then
                    conf.capabilities = vim.tbl_deep_extend("force", {}, default_caps, conf.capabilities or {})
                end

                lspconfig[server].setup(conf)
            end

            -- format on save
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-format", { clear = true }),
                callback = function(args)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = args.buf,
                        callback = function()
                            custom_format({ timeout_ms = 2500 })
                        end,
                    })
                end,
            })
        end,
        keys = {
            {
                "gD",
                vim.lsp.buf.declaration,
                desc = "Goto declaration",
            },
            {
                "gd",
                vim.lsp.buf.definition,
                desc = "Goto defintion",
            },
            {
                "K",
                vim.lsp.buf.hover,
                desc = "Documentation preview (hover)",
            },
            {
                "<leader>rn",
                vim.lsp.buf.rename,
                desc = "Rename",
            },
            {
                "<leader>ca",
                vim.lsp.buf.code_action,
                desc = "Code actions",
            },
            {
                "<leader>cf",
                function()
                    custom_format({ timeout_ms = 1500 })
                end,
            },
            {
                "<leader>ld",
                vim.diagnostic.open_float,
                desc = "Diagnostics window",
            },
        },
    },
    {
        "nvimtools/none-ls.nvim",
        opts = function()
            local builtins = require("null-ls").builtins
            local sources = {}

            for _, k in ipairs(formatters) do
                table.insert(sources, builtins.formatting[k])
            end

            for _, k in ipairs(linters) do
                table.insert(sources, builtins.diagnostics[k])
            end

            return { sources = sources }
        end,
    },
}
