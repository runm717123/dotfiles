return {
  {
    "liljaylj/codestats.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "TextChanged", "InsertEnter" },
    config = function()
      local api_key = os.getenv("CODESTATS_API_KEY")
      require("codestats").setup({
        username = "nur",                    -- Replace with your Code::Stats username
        api_key = api_key,                   -- Replace with your Code::Stats API key
        base_url = "https://exp.seni.cloud", -- Default Code::Stats base URL
        send_on_exit = true,                 -- Send XP when Neovim exits
        send_on_timer = true,                -- Send XP on a timer
        timer_interval = 60000,              -- Timer interval in milliseconds (default: 60s)
        curl_timeout = 5,                    -- Timeout for curl requests in seconds
      })
    end,
  },
}
