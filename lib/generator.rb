module Generator

  # Creates string that consists from chars and digits
  # ==Params:
  # +length+:: `:integer` length of mecessary string
  def self.provide_string(length: 1000)
    o = [('a'..'z'), (0..9)].map(&:to_a).flatten
    (0...length).map { o[rand(o.length)] }.join
  end

end