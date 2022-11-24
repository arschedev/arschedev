#
# Encoder
#

def isUpper?(string)
	string == string.upcase
end

def isLower?(string)
	string == string.downcase
end

module Encoder
	def Encoder.encode(string, shift)
		alphabetU = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split ""
		alphabetL = "abcdefghijklmnopqrstuvwxyz".split ""

		chars = string.split ""

		result = ""

		for i in 0..chars.length
			char = chars[i]

			alphabet = []

			# Upper/Lower
			if char != nil
				if isUpper? char
					alphabet = alphabetU
				elsif isLower? char
					alphabet = alphabetL
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
		Struct.new(:result, :upper, :lower).new(result, result.upcase, result.downcase)
	end
end