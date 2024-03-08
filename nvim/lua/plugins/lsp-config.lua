return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = false
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local function on_attach()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "Show documentation in hover window." })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "Jump to definition." })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "Jump to declaration." })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0, desc = "Jump to implementation." })
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { buffer = 0, desc = "Jump to type definition." })
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = 0, desc = "Jump to signature help." })
        vim.keymap.set(
            "n",
            "gq",
            function() vim.lsp.buf.format({ async = true }) end,
            { buffer = 0, desc = "Jump to signature help." }
        )
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0, desc = "Rename symbol under cursor." })
        vim.keymap.set(
            "n",
            "gr",
            require("telescope.builtin").lsp_references,
            { buffer = 0, desc = "Show references in a Telescope window." }
        )

        -- Diagnostics
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = 0, desc = "Jump to next diagnostic." })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = 0, desc = "Jump to previous diagnostic." })
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = 0, desc = "Show diagnostic information in hover." })

        -- Code actions
        if vim.lsp.buf.range_code_action then
            vim.keymap.set("x", "<leader>ca", vim.lsp.buf.range_code_action, { buffer = 0, desc = "Range code action." })
        else
            vim.keymap.set("x", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0, desc = "Code action." })
        end
      end


      local lspconfig = require("lspconfig")
      local util = require('lspconfig/util')
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = function(fname)
          local root_files = {
              'pyrightconfig.json',
              'pyproject.toml',
              'setup.py',
              'setup.cfg',
              'requirements.txt',
              'Pipfile',
          }
          return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
        end,
      })
      lspconfig.pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              rope_autoimport = {
                enabled = true
              }
            }
          }
        },
        root_dir = function(fname)
          local root_files = {
              'pyrightconfig.json',
              'pyproject.toml',
              'setup.py',
              'setup.cfg',
              'requirements.txt',
              'Pipfile',
          }
          return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
        end,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end
      })
      require("lsp_lines").setup()
      vim.diagnostic.config({ virtual_lines = false })
      vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle)
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
