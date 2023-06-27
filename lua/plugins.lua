return {
  {
    'cocopon/iceberg.vim', config = function()
      vim.cmd([[colorscheme iceberg]])
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true
  },
  {
    'numToStr/Comment.nvim',
    config = true
  },
  {
    'windwp/nvim-autopairs',
    config = true
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true
  },
  {
    'williamboman/mason.nvim',
    config = true
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/vim-vsnip', 'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer', 'hrsh7th/cmp-buffer'
    },
    config = function()
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true }
      )

      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "vsnip" }
        },
        mapping = cmp.mapping.preset.insert({
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ['<C-l>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
        }),
        experimental = {
          ghost_text = true,
        },
      })
    end
  },
  {
    'simrat39/rust-tools.nvim',
    config = function()
      require('rust-tools').setup()
      require('rust-tools').inlay_hints.enable()
    end

  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim', 'neovim/nvim-lspconfig',
      'hrsh7th/nvim-cmp', 'hrsh7th/cmp-nvim-lsp'
    },
    config = function()
      local opts = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(
          vim.lsp.protocol.make_client_capabilities()
        )
      }
      require('mason-lspconfig').setup_handlers({
        function(server)
          require('lspconfig')[server].setup(opts)
        end,
        -- ["rust_analyzer"] = function() require("lspconfig").rust_analyzer.setup(vim.tbl_deep_extend('force', opt, {
        --     settings = {
        --       ["rust-analyzer"] = {
        --         completion = {
        --           autoimport = { enable = true }
        --         }
        --       }
        --     }
        --   }))
        -- end
      })
    end
  }
}
