return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.completion = opts.completion or {}
    opts.completion.ghost_text = { enabled = true }

    opts.keymap = opts.keymap or {}
    opts.keymap["<Tab>"] = { "select_and_accept", "fallback" }
    opts.keymap["<CR>"] = { "fallback" }

    return opts
  end,
}
