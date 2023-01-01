#
# Utils
#

module Utils
  def Utils.Cls
    STDOUT.clear_screen
  end
  #
  def Utils.Pause
    print "\n"
	  STDIN.getch
  end
  #
  def Utils.isUpper?(string)
	  string == string.upcase
  end
  #
  def Utils.isLower?(string)
	  string == string.downcase
  end
end