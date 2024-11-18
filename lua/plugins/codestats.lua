-- Load the configuration from the external file
local api_keys = require("api_keys")

return {
  {
    "code-stats-vim",
    -- repo = "https://gitlab.com/code-stats/code-stats-vim",
    repo = "gitlab:code-stats/code-stats-vim",
    config = function()
      -- Use the API key, custom URL, and username from the external file
      vim.g.codestats_api_key = api_keys.codestats.api_keys
      vim.g.codestats_url = api_keys.codestats.url
      vim.g.codestats_username = api_keys.codestats.username
    end,
  },
}
