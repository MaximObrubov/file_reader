# require 'nmax/generator'
require 'benchmark'


module NMax
  
  MAX_LENGTH = 1000
  
  # include Generator
  
  def self.provide_string(length: 1000)
    o = [('a'..'z'), (0..9)].map(&:to_a).flatten
    (0...length).map { o[rand(o.length)] }.join
  end
    
  def self.get(str: nil)
    # unless (ARGV.count > 0 && numeric?(ARGV[0]))
    #   raise "N parameter not passed"
    # end
    # n = ARGV[0].to_i
    answer = []
    current = ''
    n = 10
    
    # $stdin.each_char do |char|
    str.each_char do |char|
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
    output(answer)
  end
  
  def self.numeric?(str)
    str.match?(/^\d+$/)
  end
  
  def self.output(to_print)
    puts "=" * 50
    puts to_print
    puts "=" * 50
  end
    
end

Benchmark.bm do |x|
  str = NMax::provide_string({length: 1000000})
  x.report { NMax::get(str: str) }
end
