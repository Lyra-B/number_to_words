require 'pry'

module NumberToWords
  def to_words(number = self)
  	nums_to_words = ['', 'one','two','three','four', 'five', 'six', 'seven', 
		'eight', 'nine', 'ten','eleven','twelve','thirteen','fourteen', 
		'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
		tens_in_words = [ '','ten','twenty', 'thirty', 'forty', 'fifty', 'sixty', 
		'seventy', 'eighty', 'ninety']
    case number
    	when 0..19
    		nums = (0..19)
				nums.map{|k| k.to_s.to_sym}
				numbers_one_to_nineteen = Hash[nums.to_a.zip(nums_to_words)]
				numbers_one_to_nineteen.each{|key,value| number = value if key==number}
				number
		  when 20..99
				digits = number.to_s.split('').map{|k| k.to_i}
				#binding.pry
				if digits[1] == 0
				 	number = tens_in_words[digits[0]]
				else
					digits[0] = tens_in_words[digits[0]]
					digits[1] = nums_to_words[digits[1]]
					number = "#{digits[0]}-#{digits[1]}"
				end
      when 100..999
      	digits = number.to_s.split('').map{|k| k.to_i}
      	if digits[1] == 1
      		"#{nums_to_words[digits[0]]} hundred #{nums_to_words[digits[2]-10]} ".strip
      	elsif digits[1] == 0
      		"#{nums_to_words[digits[0]]} hundred #{nums_to_words[digits[2]]} ".strip
      	# if digits[1]==0 && digits[2]==0
      	# 	number = "#{nums_to_words[digits[0]]} hundred"
      	# elsif digits[2] == 0
      	#   number = 
      	#   "#{nums_to_words[digits[0]]} hundred #{tens_in_words[digits[1]-1]}"
      	# elsif digits[1] == 0
      	# 	number = 
      	# 	"#{nums_to_words[digits[0]]} hundred #{one_to_ten_in_words[digits[2]].delete('-')}" 
      	else
      		number = 
      		"#{nums_to_words[digits[0]]} hundred #{tens_in_words[digits[1]]}-#{nums_to_words[digits[2]]} ".gsub(/- /, '').strip
      	end
      when 1000..9999
				digits = number.to_s.split('').map{|k| k.to_i}
				if digits[1] == 0 && digits[2] == 0
					number = "#{nums_to_words[digits[0]]} thousand #{nums_to_words[digits[3]]} ".strip
				elsif digits[1] == 0 && digits[2] == 1
					number = "#{nums_to_words[digits[0]]} thousand #{nums_to_words[digits[3]-10]} ".strip
				elsif digits[1] == 0
					number = "#{nums_to_words[digits[0]]} thousand #{tens_in_words[digits[2]]}-#{nums_to_words[digits[3]]} ".gsub(/- /, '').strip
				elsif digits[2] == 0
					number = "#{nums_to_words[digits[0]]} thousand #{nums_to_words[digits[1]]} hundred #{nums_to_words[digits[3]]} ".strip
				elsif digits[2] == 1
		    	number = "#{nums_to_words[digits[0]]} thousand #{nums_to_words[digits[1]]} hundred #{nums_to_words[digits[3]-10]} ".strip 
        else
          number = "#{nums_to_words[digits[0]]} thousand #{nums_to_words[digits[1]]} hundred #{tens_in_words[digits[2]]}-#{nums_to_words[digits[3]]}  ".gsub(/- /, '').strip
        end
      when 10000..99999

    end
  end
end

class Fixnum
  include NumberToWords
end




