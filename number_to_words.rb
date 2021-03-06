require 'pry'

module NumberToWords
  def to_words(number = self)
  	nums_to_words = ['', 'one','two','three','four', 'five', 'six', 'seven', 
		'eight', 'nine', 'ten','eleven','twelve','thirteen','fourteen', 
		'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
		tens_in_words = [ '','ten','twenty', 'thirty', 'forty', 'fifty', 'sixty', 
		'seventy', 'eighty', 'ninety']
		digits = number.to_s.split('').map{|k| k.to_i}
    case number
    	when 0..19
    		nums = (0..19)
				numbers_one_to_nineteen = Hash[nums.to_a.zip(nums_to_words)]
				numbers_one_to_nineteen[number]
		  when 20..99
				if digits[1] == 0
				 	tens_in_words[digits[0]]
				else
					digits[0] = tens_in_words[digits[0]]
					digits[1] = nums_to_words[digits[1]]
					"#{digits[0]}-#{digits[1]}"
				end
      when 100..999
      	if digits[1] == 1
      		"#{nums_to_words[digits[0]]} hundred #{nums_to_words[digits[2]-10]} ".strip
      	else
      		"#{nums_to_words[digits[0]]} hundred #{tens_in_words[digits[1]]} #{nums_to_words[digits[2]]} ".strip.gsub(/y /,'y-').squeeze(' ')
      	end
      when 1000..9999
      	thousands = digits[0].to_words
      	hundreds = [digits[1], digits[2],digits[3]].join.to_i.to_words
      	"#{thousands} thousand #{hundreds}".strip
      when 10000..99999
      	thousands= [digits[0], digits[1]].join.to_i.to_words
      	hundreds = [digits[2], digits[3],digits[4]].join.to_i.to_words
      	"#{thousands} thousand #{hundreds}".strip
      when 100000..999999
      	thousands= [digits[0], digits[1], digits[2]].join.to_i.to_words
      	hundreds = [digits[3], digits[4],digits[5]].join.to_i.to_words
      	"#{thousands} thousand #{hundreds}".strip 
      when 1000000
      	"one million"
    end
  end
end

class Fixnum
  include NumberToWords
end




