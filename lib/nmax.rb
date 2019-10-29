module NMax
  
  class Generator
    def self.test_string(length: 1000)
      o = [('a'..'z'), (0..9)].map(&:to_a).flatten
      (0...length).map { o[rand(o.length)] }.join
    end
  end
  
  
  class Reader
    
    MAX_LENGTH = 1000
    
    def self.get
      unless (ARGV.count > 0 && numeric?(ARGV[0]))
        raise "N parameter not passed"
      end
      n = ARGV[0].to_i
      answer = []
      current = ''
      
      $stdin.each_char do |char|
        if numeric?(char)
          current << char
        else
          answer << current.to_i unless current.empty?
          current = ''
        end
      end
      
      answer.sort!.reverse!
      
      puts "=" * 50
      p answer[0..n]
      puts "=" * 50
    end
    
    def self.numeric?(str)
      str.match?(/^\d+$/)
    end
    
  end
end