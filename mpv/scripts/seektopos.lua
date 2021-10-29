-- Troy Pracy <troyp7@gmail.com>
-- Requires mpv-user-input script <https://github.com/CogentRedTester/mpv-user-input>

local mp = require "mp"

package.path = mp.command_native({"expand-path", "~~/script-modules/?.lua;"})..package.path
local ui = require "user-input-module"
local get_user_input = ui.get_user_input

mp.add_key_binding(
  "%",
  "seek-to-percentage",
  function()
    get_user_input(
      function(input)
        mp.commandv("seek", input or "", "absolute-percent")
      end,
      {
        text = "Percentage:",
        replace = true
      }
    )
  end
)

mp.add_key_binding(
  "@",
  "seek-to-time",
  function()
    get_user_input(
      function(input)
        mp.commandv("seek", input or "", "absolute")
      end,
      {
        text = "Time:",
        replace = true
      }
    )
  end
)

mp.add_key_binding(
  "g",
  "smart-seek-to",
  function()
    get_user_input(
      function(input)
        if string.sub(input,1,1)=="." then
          mp.commandv("seek", string.sub(input,2,-1), "absolute-percent")
        else
          mp.commandv("seek", input or "", "absolute")
        end
      end,
      {
        text = "Seek to (time or .percent):",
        replace = true
      }
    )
  end
)
