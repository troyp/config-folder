-- https://github.com/mpv-player/mpv/issues/4184#issuecomment-629756234

local os = require 'os'

mp.enable_messages('error')

function lg(e)
  if e.level == "error" then
    print("Exiting...")
    os.exit(2)
  end
end

mp.register_event("log-message", lg)
