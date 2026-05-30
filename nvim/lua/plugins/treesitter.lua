return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local languages = { "c", "cpp", "rust", "python", "zig", "go", "html", "css", "svelte", "javascript", "typescript", "lua", "markdown" , "tsx", "elixir" }

    local filetypes = {}
      for _, lang in ipairs(languages) do
        for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
          table.insert(filetypes, ft)
        end
      end
    
    require('nvim-treesitter').install(languages)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function() vim.treesitter.start() end,
    })
  end
}

