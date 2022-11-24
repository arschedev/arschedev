#
# stdgets
#

require 'io/console'
require 'io/wait'

def stdgets(exit_char = "")
  string = ""
  #
  loop do
    char = STDIN.getch
    char << STDIN.getch while STDIN.ready? # Process multi-char paste (?)
    break if ["\r", "\n", "\r\n"].include? char # Exit on "enter"
    if char == exit_char # Exit on exit_char
      print "\n"
      exit
    end
    next if char == "\b" # Escape backspaces
    next if char.length > 1 # Escape "�"
    print char
    string << char
  end
  #
  string
end