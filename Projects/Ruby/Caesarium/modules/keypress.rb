#
# Keypress
#

require 'io/console'

module Keypress
  def Keypress.Handle(&block)
    key = STDIN.getch
    block.call key
  end
  #
  def Keypress.LoopHandle(&block)
    loop do
      key = STDIN.getch
      block.call key
    end
  end
end