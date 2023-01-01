#
# Title
#

require 'os'

module Title
  def Title.SetTitle(title)
    system("title #{title}") if OS.windows?
    system("echo \"\033]0;#{title}\007\"") if OS.linux?
    system("echo -n -e \"\033]0;#{title}\007\"") if OS.mac?
  end
end