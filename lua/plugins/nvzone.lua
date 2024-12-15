return {
  -- color picker
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
    dependencies = "nvzone/volt",
    keys = {
      { "<leader>ac", "<cmd>Shades<cr>" },
      { "<leader>aC", "<cmd>Huefy<cr>" },
    },
  },
  -- screen caster
  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    keys = {
      { "<leader>ak", "<cmd>ShowkeysToggle<cr>" },
    },
    opts = {
      show_count = true,
    },
  },
  -- better typer
  {
    "nvzone/typr",
    cmd = { "Typr", "TyprStats" },
    keys = {
      { "<leader>at", "<cmd>Typr<cr>" },
      { "<leader>aT", "<cmd>TyprStats<cr>" },
    },
  },
  -- fancy timer
  {
    "nvzone/timerly",
    cmd = "TimerlyToggle",
    dependencies = "nvzone/volt",
    keys = {
      { "<leader>al", "<cmd>TimerlyToggle<cr>" },
    },
  },
}
