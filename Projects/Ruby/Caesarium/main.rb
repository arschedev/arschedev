##
# Copyright (c) 2023 arschedev
#

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
	Keypress.Handle do |k|
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
	# interrupt handle
	trap "SIGINT" do
		exit 130
	end
	#
	print Parts.MESSAGE(decodeMode)
	loop do
		message = gets.chomp.strip
		if message != ""
			break
		else
			Utils.Cls
			puts Parts.CAESARIUM
			puts Parts.DIALOG
			print Parts.MESSAGE(decodeMode)
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
			print Parts.MESSAGE(decodeMode, "#{message}\n")
			print Parts.SHIFT
			next
		end
	end
end

# Shift validation
if shift > 26
	loop do
		shift -= 26;
		next if shift > 26
		break
	end
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