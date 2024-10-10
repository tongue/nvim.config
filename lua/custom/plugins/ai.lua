return {
  'frankroeder/parrot.nvim',
  dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
  -- optionally include "rcarriga/nvim-notify" for beautiful notifications
  config = function()
    require('parrot').setup {
      -- Providers must be explicitly added to make them available.
      providers = {
        anthropic = {
          api_key = os.getenv "ANTHROPIC_API_KEY",
        },
        -- gemini = {
        --   api_key = os.getenv "GEMINI_API_KEY",
        -- },
        -- groq = {
        --   api_key = os.getenv "GROQ_API_KEY",
        -- },
        -- mistral = {
        --   api_key = os.getenv "MISTRAL_API_KEY",
        -- },
        -- pplx = {
        --   api_key = os.getenv "PERPLEXITY_API_KEY",
        -- },
        -- -- provide an empty list to make provider available (no API key required)
        -- ollama = {},
        -- openai = {
        --   api_key = os.getenv "OPENAI_API_KEY",
        -- },
        -- github = {
        --   api_key = os.getenv "GITHUB_TOKEN",
        -- },
      },
      hooks = {
        CodeConsultant = function(prt, params)
          local chat_prompt = [[
              Your task is to analyze the provided {{filetype}} code and suggest
              improvements to optimize its performance. Identify areas where the
              code can be made more efficient, faster, or less resource-intensive.
              Provide specific suggestions for optimization, along with explanations
              of how these changes can enhance the code's performance. The optimized
              code should maintain the same functionality as the original code while
              demonstrating improved efficiency.

              Here is the code
              ```{{filetype}}
              {{filecontent}}
              ```
            ]]
          prt.ChatNew(params, chat_prompt)
        end,
      },
    }
  end,
}
