require 'minitest/autorun'
require './number_to_words'

class NumberToWordsTest < MiniTest::Test
  describe "to_words" do
    it "should handle individual numbers" do
      1.to_words.must_equal("one")
      2.to_words.must_equal("two")
      3.to_words.must_equal("three")
      11.to_words.must_equal("eleven")
      12.to_words.must_equal("twelve")
    end

    it "should handle the teens" do
		  16.to_words.must_equal("sixteen")
		  19.to_words.must_equal("nineteen")
		end

		it "should handle twenties" do
		  30.to_words.must_equal("thirty")
		  23.to_words.must_equal("twenty-three")
		  26.to_words.must_equal("twenty-six")
		  38.to_words.must_equal("thirty-eight")
		  45.to_words.must_equal("forty-five")
		  68.to_words.must_equal("sixty-eight")
		  72.to_words.must_equal("seventy-two")
		  84.to_words.must_equal("eighty-four")
		  97.to_words.must_equal("ninety-seven")
		end

		it "should handle one-hundred to nine hundred ninety-nine" do	  
		  120.to_words.must_equal("one hundred twenty")
		  100.to_words.must_equal("one hundred")
		  119.to_words.must_equal("one hundred nineteen")
		  101.to_words.must_equal("one hundred one")
		  200.to_words.must_equal("two hundred")
		  235.to_words.must_equal("two hundred thirty-five")
		  448.to_words.must_equal("four hundred forty-eight")
		  569.to_words.must_equal("five hundred sixty-nine")
		  378.to_words.must_equal("three hundred seventy-eight")
		  789.to_words.must_equal("seven hundred eighty-nine")
		  193.to_words.must_equal("one hundred ninety-three")
		end

		it "should handle one thousand to nine thousand nine hundred ninety-nine" do
			1020.to_words.must_equal("one thousand twenty")
			1111.to_words.must_equal("one thousand one hundred eleven")
		  1000.to_words.must_equal("one thousand")
		  1001.to_words.must_equal("one thousand one")
		  1011.to_words.must_equal("one thousand eleven")
		  1078.to_words.must_equal("one thousand seventy-eight")
		  1100.to_words.must_equal("one thousand one hundred")
		  1216.to_words.must_equal("one thousand two hundred sixteen")
		  1225.to_words.must_equal("one thousand two hundred twenty-five")
		  2000.to_words.must_equal("two thousand")
		  2356.to_words.must_equal("two thousand three hundred fifty-six")
		  6863.to_words.must_equal("six thousand eight hundred sixty-three")
		  8864.to_words.must_equal("eight thousand eight hundred sixty-four")
		  9956.to_words.must_equal("nine thousand nine hundred fifty-six")
		end

		# it "should handle ten thousand to ninety nine thousand nine hundred ninety-nine" do
		# end

		# it "should handle one hundred thousand to one million" do
		# end

	end
end