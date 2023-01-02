#
# Parts
#

require 'colorize'

require './modules/parts/CAESARIUM.rb'

module Parts
  def Parts.CAESARIUM
    CAESARIUM.light_cyan + "\n#{" " * 15}by github.com/arschedev\n\n".light_cyan
  end
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
  def Parts.MESSAGE(decodeMode = false, value = "")
    " [#{decodeMode ? "DECODE" : "ENCODE"}]\n".light_green +
    " Message: ".light_yellow + value
  end
  #
  def Parts.SHIFT
    " Shift: ".light_yellow
  end
end