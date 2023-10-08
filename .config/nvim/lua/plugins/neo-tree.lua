if true then
  return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      requires = {
        "nvim-tree/nvim-web-devicons",
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  }
end
