require 'generator'

module NMax
  
  extend Generator
  
  MAX_LENGTH = 1000
  
  # provides an +array+ of n biggest numbers from stdin
  # ==Params:
  # +n+:: `:integer` amount of selected numbers
  def self.get(n)
    answer = []
    current = ''
    
    $stdin.each_char do |char|
      if current && current.length < MAX_LENGTH && numeric?(char)
        current << char
      else
        next if current.empty?
        current = current.to_i
        index = answer.bsearch_index { |num| num < current }
        index ? answer.insert(index, current) : answer << current
        answer = answer[0...n] if answer.count > n
        current = ''
      end
    end
    answer
  end
  
  def self.numeric?(str)
    str.match?(/^\d+$/)
  end

end
