local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.list = true
-- vim.opt.listchars:append "eol:¬"

vim.g.mapleader = ' '

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require("lazy").setup({
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        window = {
          border = "rounded",
          padding = { 2, 2, 2, 2 },
        },
        triggers = { "<leader>" },
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          },
        },
      })
    end,
  },
  { "mfussenegger/nvim-dap" },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require('dapui').setup({
        layouts = {
          {
            position = "left",
            size = 40,
            elements = {
              {
                id = "breakpoints",
                size = 0.10,
              },
              {
                id = "stacks",
                size = 0.25,
              },
              {
                id = "watches",
                size = 0.25,
              },
              {
                id = "scopes",
                size = 0.40,
              },
            },
          },
          {
            position = "bottom",
            size = 15,
            elements = {
              -- {
              --  id = "console",
              --  size = 0.5,
              -- },
              {
                id = "repl",
                size = 1,
              }
            },
          },
        }
      })
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("mason-nvim-dap").setup({})
      require('dap').adapters.go = {
        type = "server",
        port = '63370',
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:63370" },
        },
      }
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
        vim.cmd ':NeoTreeClose'
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
        vim.cmd ':NeoTreeShow'
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
        vim.cmd ':NeoTreeShow'
      end

      vim.cmd 'DapLoadLaunchJSON'
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require('null-ls').setup({
        sources = {
          require('null-ls').builtins.formatting.goimports,
        }
      })
    end
  },
  {
    "jay-babu/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({})
    end
  },
  {
    "Darazaki/indent-o-matic",
    config = function()
      require("indent-o-matic").setup({
        standard_widths = { 2, 4 }
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup()
    end,
  },
  { "MunifTanjim/nui.nvim" },
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.opt.termguicolors = true
      vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1c1c29 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guibg=#20202e gui=nocombine]]
      require("indent_blankline").setup({
        char = "",
        char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
        },
        space_char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
        },
        show_trailing_blankline_indent = false,
        show_current_context = true,
      })
    end,
  },
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require('mini.indentscope').setup()
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({})
      vim.cmd ":TSUpdate"
      vim.cmd ":TSEnable highlight"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup({
        filetypes = { "html" , "xml" },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        enable_git_status = false,
        window = {
          position = 'right',
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({})
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      local lsp = require("lspconfig")
      lsp.gopls.setup({
        on_attach = on_attach,
      })
      lsp.rust_analyzer.setup({
        on_attach = on_attach,
        cmd = {
          "rustup", "run", "stable", "rust-analyzer",
        },
      })
    end,
  },
  {
    "ms-jpq/coq_nvim",
    config = function()
      vim.cmd("COQnow")
      _G.coq_settings = {
        clients = {
          tabnine = {
            enabled = true
          }
        }
      }
    end,
  },
   -- { "ms-jpq/coq.artifacts" },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
      })
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },
  { "dstein64/vim-startuptime" },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('toggleterm').setup()
    end,
  },
  {
  "ggandor/leap.nvim",
  config = function()
    require('leap').add_default_mappings()
  end
  }
})


vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format({ async = true }) ]]

map("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<leader>fl", ":Telescope lsp_document_symbols<CR>", { silent = true })
map("n", "<leader>fz", ":Telescope current_buffer_fuzzy_find<CR>", { silent = true })

map("n", "<leader>h", ":ToggleTerm direction=horizontal size=20<CR>", { silent = true })
map("n", "<leader>v", ":ToggleTerm direction=vertical size=60<CR>", { silent = true })

map("n", "<leader>du", ":lua require('dapui').toggle()<CR>", { silent = true })
map("n", "<leader>db", ":DapToggleBreakpoint<CR>", { silent = true })
map("n", "<leader>dc", ":DapContinue<CR>", { silent = true })
map("n", "<leader>dt", ":DapTerminate<CR>", { silent = true })

map("n", "<C-b>", ":NeoTreeShowToggle<CR>", { silent = true })
map("n", "<C-s>", ":w<CR>", { silent = true })
map("i", "<C-s>", "<esc>:w<CR>", { silent = true })
