#
# Keypress
#

require 'io/console'

module Keypress
  def Keypress.Handle(&block)
    loop do
      key = STDIN.getch
      block.call key
    end
  end
end