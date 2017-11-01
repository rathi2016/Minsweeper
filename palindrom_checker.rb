# Check if characters of a given string can be rearranged to form a palindrome:

# we can have two separate function
# 1- checking if the given string satifies conditions for it do be a palindrome
  #   at most one character occurs odd number of times and all characters occur even number of times.
# 2- to convert given string into palidrome
require 'pry'
class Palindrom
  def initialize(word)
    @word = word
    can_form_palindrome?
  end
  def can_form_palindrome?
    splitting_arr = @word.downcase.split(//)
    hash = Hash.new()
    odd = []
    splitting_arr.each do |chr|
      if( hash.keys.include?(chr))
        hash[chr] += 1
      else
        hash[chr] = 1
      end
    end
      hash.values.each do |value|
        odd << value if value.odd?
      end
    a true if (odd.length == 1 || odd.length == 0)
  end

end
rathi = Palindrom.new("Malayyalam")
