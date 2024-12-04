local gen = require('gen')

gen.setup({
    model = "llama3",     -- The default model to use.
    host = "localhost",   -- The host running the Ollama service.
    port = "11434",       -- The port on which the Ollama service is listening.
    display_mode = "split", -- The display mode. Can be "float" or "split".
    show_prompt = false,  -- Shows the Prompt submitted to Ollama.
    show_model = false,   -- Displays which model you are using at the beginning of your chat session.
    quit_map = "q",       -- set keymap for quit
    no_auto_close = false, -- Never closes the window automatically.
    debug = false,        -- Prints errors and the command which is run.
    command = function(options)
        local body = { model = options.model, stream = true }
        return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
    end,
})
