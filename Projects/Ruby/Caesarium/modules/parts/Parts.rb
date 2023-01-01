#
# Parts
#

require 'colorize'

require './VERSION.rb'

module Parts
  #
  def Parts.CAESARIUM
"   _____                           _
  / ____| #{VERSION}                  (_)
 | |     __ _  ___  ___  __ _ _ __ _ _   _ _ __ ___
 | |    / _` |/ _ \\/ __|/ _` | '__| | | | | '_ ` _ \\
 | |___| (_| |  __/\\__ \\ (_| | |  | | |_| | | | | | |
  \\_____\\__,_|\\___||___/\\__,_|_|  |_|\\__,_|_| |_| |_|
".light_cyan + "\n#{" " * 15}by github.com/arschedev\n\n".light_cyan
  end
  #
  #
  def Parts.DIALOG
    " Press ".light_blue +
    "[E]".light_magenta +
    " to encode message\n".light_blue +
    " Press ".light_blue +
    "[D]".light_magenta +
    " to decode".light_blue + "\n\n"
  end
  #
  #
  def Parts.MESSAGE(value = "")
    " Message: ".light_yellow + value
  end
  #
  #
  def Parts.SHIFT
    " Shift: ".light_yellow
  end
  #
end