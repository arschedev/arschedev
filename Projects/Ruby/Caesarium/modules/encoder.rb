#
# Encoder
#

require './modules/Utils.rb'

module Encoder
	def Encoder.Encode(message, shift)
		alphabets = Struct
			.new(:latin_upper, :latin_lower)
			.new("ABCDEFGHIJKLMNOPQRSTUVWXYZ".split(""), "abcdefghijklmnopqrstuvwxyz".split(""))

		chars = message.split ""

		result = ""

		for i in 0..chars.length
			char = chars[i]

			alphabet = []

			# Upper/Lower
			if char != nil
				if Utils.isUpper? char
					alphabet = alphabets.latin_upper
				elsif Utils.isLower? char
					alphabet = alphabets.latin_lower
				else
					result << char
					next
				end
			else
				next
			end

			# [^A-Z]
			if not alphabet.index char
				result << char if char != nil
				next
			end

			# A->Z
			if alphabet.index(char) + shift > alphabet.length - 1
				result << alphabet[(alphabet.index(char) + shift) - alphabet.length]

			# A<-Z
			elsif alphabet.index(char) + shift < 0
				result << alphabet[alphabet.length - (alphabet.index(char) + shift).abs]

			# A-Z
			else
				result << alphabet[alphabet.index(char) + shift]
			end
		end

		# return
		Struct.new(:normal, :upper, :lower).new(result, result.upcase, result.downcase)
	end
end