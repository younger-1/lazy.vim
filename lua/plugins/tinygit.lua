return {
  {
    "chrisgrieser/nvim-tinygit",
    dependencies = "stevearc/dressing.nvim",
    keys = {
      { "<leader>gjs", '<cmd>lua require("tinygit").interactiveStaging()<cr>', desc = "Patch stage" },
      { "<leader>gjc", '<cmd>lua require("tinygit").smartCommit()<cr>', desc = "Commit" },
      { "<leader>gja", '<cmd>lua require("tinygit").amendOnlyMsg()<cr>', desc = "Amend msg" },
      { "<leader>gjA", '<cmd>lua require("tinygit").amendNoEdit()<cr>', desc = "Amend" },
      { "<leader>gjf", '<cmd>lua require("tinygit").fixupCommit()<cr>', desc = "Fixup" },
      { "<leader>gju", '<cmd>lua require("tinygit").undoLastCommitOrAmend()<cr>', desc = "Undo last commit/amend" },
      --
      { "<leader>gjp", '<cmd>lua require("tinygit").push()<cr>', desc = "Push" },
      { "<leader>gjP", '<cmd>lua require("tinygit").push({ forceWithLease = true })<cr>', desc = "Push (force)" },
      --
      -- { "<leader>gji", '<cmd>lua require("tinygit").issuesAndPrs()<cr>', desc = "Pick issue/pr" },
      { "<leader>gji", '<cmd>lua require("tinygit").issuesAndPrs({ type = "issue" })<cr>', desc = "Pick issue" },
      { "<leader>gjI", '<cmd>lua require("tinygit").issuesAndPrs({ type = "pr" })<cr>', desc = "Pick pr" },
      { "<leader>gjo", '<cmd>lua require("tinygit").openIssueUnderCursor()<cr>', desc = "Open issue/PR" },
      { "<leader>gjy", '<cmd>lua require("tinygit").githubUrl("file")<cr>', desc = "File URL", mode = { "n", "x" } },
      { "<leader>gjY", '<cmd>lua require("tinygit").githubUrl("repo")<cr>', desc = "Reop URL", mode = { "n", "x" } },
      -- stylua: ignore
      { "<leader>gjh", '<cmd>lua require("tinygit").fileHistory()<cr>', desc = "History by file/line/word", mode = { "n", "x" } },
      --
      { "<leader>gjz", '<cmd>lua require("tinygit").stashPush()<cr>', desc = "Stash push" },
      { "<leader>gjZ", '<cmd>lua require("tinygit").stashPop()<cr>', desc = "Stash pop" },
    },
  },
}
