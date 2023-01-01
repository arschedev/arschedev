# ruby main.rb
# ruby main.rb <message> <shift>
# ruby main.rb "Hello World!" 2

require 'colorize'

require 'io/console'
require './modules/title.rb'
require './modules/parts/Parts.rb'
require './modules/encoder.rb'
require './modules/keypress.rb'
require './modules/Utils.rb'

cli_mode = false

message = "", shift = 0

decodeMode = false

# Title
Title.SetTitle("Caesarium")

# Command Line Arguments
if ARGV[0] && ARGV[1]
	message = ARGV[0]
	shift = ARGV[1].to_i

# Command Line Interface
else
	cli_mode = true
	#
	puts Parts.CAESARIUM
	puts Parts.DIALOG
	#
	Keypress.LoopHandle do |k|
		k = k.downcase
		# cyrillic to latin
		k = "e" if k == "у"
		k = "d" if k == "в"
		#
		decodeMode = true if k == "d"
		break if k == "e" || k == "d"
		if k == ""
			print "\n"
			exit
		end
	end
	#
	print Parts.MESSAGE
	loop do
		message = gets.chomp.strip
		if message != ""
			break
		else
			Utils.Cls
			puts Parts.CAESARIUM
			puts Parts.DIALOG
			print Parts.MESSAGE
			next
		end
	end
	#
	print Parts.SHIFT
	loop do
		shift = gets.chomp.strip
		if shift != ""
			if shift.to_i == 0
				puts " Error: invalid shift value".red
				print "\n Shift: ".light_yellow
				next
			end
			shift = shift.to_i
			break
		else
			Utils.Cls
			puts Parts.CAESARIUM
			puts Parts.DIALOG
			print Parts.MESSAGE("#{message}\n")
			print Parts.SHIFT
			next
		end
	end
end

# Shift limit
if shift > 26
	if cli_mode
		puts " Error: #{shift} for shift is too much. The maximum is 26".red
		Utils.Pause
	else
		puts "Error: given shift is too big. The maximum is 26"
	end
	exit 1
end

RESULT = Encoder.Encode(message, decodeMode ? -shift : shift)

if cli_mode
	puts "\n " + "Result: ".light_magenta + "#{RESULT.normal.light_white}" +
	"\n | ".light_yellow + "Upper: ".light_magenta + "#{RESULT.upper.light_white}" +
	"\n | ".light_yellow + "Lower: ".light_magenta + "#{RESULT.lower.light_white}"
else
	puts RESULT.normal
	exit 0
end

# Press any key to continue...
Utils.Pause