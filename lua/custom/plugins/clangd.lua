return {
  'neovim/nvim-lspconfig',
  --not sure if necesary
  event = 'BufReadPre',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' }, -- if you use nvim-cmp
  config = function()
    local custom_opts = {
      -- This tells clangd how to behave
      cmd = {
        'clangd',
        '--background-index',
        '--clang-tidy',
      },

      -- These are the flags used if no compile_commands.json exists
      init_options = {
        fallbackFlags = {
          '-Iinclude', -- Works if root is project folder
          '-I../include', -- Works if root is src/ (safety net)
          '-std=c17',
          '-Wall',
          '-Wextra',
        },
      },

      -- Logic to determine the project root
      -- root_dir = lspconfig.util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git', 'init.lua'),
    }
    require('lspconfig').clangd.setup(custom_opts)
  end,
}
