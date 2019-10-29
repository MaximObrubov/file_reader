module NMax
  
  class Generator
    def self.test_string(length: 1000)
      o = [('a'..'z'), (0..1000)].map(&:to_a).flatten
      (0...length).map { o[rand(o.length)] }.join
    end
  end
  
  class Reader
    def self.read_char
      puts "read char"
    end
  end
end