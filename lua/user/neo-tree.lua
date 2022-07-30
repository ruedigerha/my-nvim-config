vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})

require("neo-tree").setup({
  sources = {
    "filesystem",
    "buffers",
    "git_status",
    "diagnostics",
    -- ...and any additional source
  },
  -- These are the defaults
  diagnostics = {
    bind_to_cwd = true,
    diag_sort_function = "severity", -- "severity" means diagnostic items are sorted by severity in addition to their positions.
                                     -- "position" means diagnostic items are sorted strictly by their positions.
                                     -- May also be a function.
    follow_behavior = { -- Behavior when `follow_current_file` is true
      always_focus_file = false, -- Focus the followed file, even when focus is currently on a diagnostic item belonging to that file.
      expand_followed = true, -- Ensure the node of the followed file is expanded
      collapse_others = true, -- Ensure other nodes are collapsed
    },
    follow_current_file = true,
    group_dirs_and_files = true, -- when true, empty folders and files will be grouped together
    group_empty_dirs = true, -- when true, empty directories will be grouped together
    show_unloaded = true, -- show diagnostics from unloaded buffers
  },
})

vim.api.nvim_set_keymap('n', '<leader>gd', ':Neotree diagnostics reveal bottom<cr>', { noremap = true })
