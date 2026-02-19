return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install{
      "c", "cpp", "rust", "python", "zig", "go", "html", "css", "svelte", "javascript", "typescript", "lua", "markdown" , "tsx", "elixir" 
    }
  end
}

