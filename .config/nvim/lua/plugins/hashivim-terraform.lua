return {
  -- add symbols-outline
  {
    "hashivim/vim-terraform",
    init = function()
      vim.g.terraform_fmt_on_save = 1
      vim.g.terraform_align = 1
    end,
  },
}
