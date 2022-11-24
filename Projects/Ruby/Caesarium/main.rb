# ruby main.rb
# ruby main.rb <string> <shift>
# ruby main.rb "Hello World!" 2

require 'colorize'
require 'os'

require 'io/console'
require './modules/ASCII.rb'
require './modules/encoder.rb'
require './modules/keypress.rb'
require './modules/stdgets.rb'

def pause
	print "\n"
	STDIN.getch
end

cli = false

string = "", shift = 0

decode = false

# Title
system("title Caesarium") if OS.windows?
system("echo \"\033]0;Caesarium\007\"") if OS.linux?
system("echo -n -e \"\033]0;Caesarium\007\"") if OS.mac?

# Command Line Arguments
if ARGV[0] && ARGV[1]
	string = ARGV[0]
	shift = ARGV[1].to_i

# Command Line Interface
else
	cli = true
	puts "#{ASCII.light_cyan}\n#{" " * 20}by @arschedev\n\n".light_cyan
	#
	puts " Press ".light_blue +
	"[1]".light_magenta +
	" to encode message, ".light_blue +
	"[2]".light_magenta +
	" to decode".light_blue
	print "\n"
	#
	loop do
		breakl = false
		Keypress.Handle do |k|
			decode = true if k == "2"
			breakl = true if k == "2" or k == "1"
			if k == ""
				print "\n"
				exit
			end
		end
		break if breakl
	end
	#
	print " Message: ".light_yellow
	loop do
		string = stdgets
		string == "" ? next : break
	end
	#
	print "\n Shift: ".light_yellow
	loop do
		shift = stdgets
		shift.strip!
		next if shift == ""
		if shift.to_i == 0
			puts "\n Error: invalid shift value".red
			print "\n Shift: ".light_yellow
			next
		end
		shift = shift.to_i
		break
	end
end

# Shift limit
if shift > 26
	if cli
		puts "\n Error: #{shift} for shift is too much. The maximum is 26".red
		pause
	else
		puts "Error: given shift is too big. The maximum is 26"
	end
	exit 1
end

ENCODED = Encoder.encode(string, decode ? -shift : shift)

if cli
	puts "\n\n " + "Result: ".light_magenta + "#{ENCODED.result.light_white}" +
	"\n | ".light_yellow + "Upper: ".light_magenta + "#{ENCODED.upper.light_white}" +
	"\n | ".light_yellow + "Lower: ".light_magenta + "#{ENCODED.lower.light_white}"
else
	puts ENCODED.result
	exit 0
end

# Press any key to continue...
pause