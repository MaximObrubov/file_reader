require 'minitest/autorun'
require 'nmax'

class NMaxTest < Minitest::Test
  
  CHUNK_SIZE = 1024
  TMP_FILE = 'spec/examples.txt'
  
  def test_one_chunk
    $stdin = StringIO.new(NMax::provide_string(length: CHUNK_SIZE))
    assert_operator(NMax::get(4).count, :<=,  4)
  end
  
  def test_file
    chunks_count = 10
    chunk_size = 1024
  
    File.open(TMP_FILE, "w") do |file|
      chunks_count.times do |i|
        file.write NMax::provide_string(length: chunk_size)
      end
      # NOTE: to be sure that in generated sequence 1 digit is
      #       definitely presents
      file.write("1")
    end
  
    res = `cat #{TMP_FILE} | ./nmax 4`.match(/(\d+\,?)/)
    assert_operator(res.size, :<=,  4)
    assert_operator(res.size, :>=,  1)
    `rm #{TMP_FILE}`
  end
  
  def test_big_file
    chunks_count = 100000
    chunk_size = 1024
  
    File.open(TMP_FILE, "w") do |file|
      chunks_count.times do |i|
        file.write NMax::provide_string(length: chunk_size)
      end
      # NOTE: to be sure that in generated sequence 1 digit is
      #       definitely presents
      file.write("1")
    end
  
    res = `cat #{TMP_FILE} | ./nmax 4`.match(/(\d+\,?)/)
    assert_operator(res.size, :<=,  4)
    assert_operator(res.size, :>=,  1)
    `rm #{TMP_FILE}`
  end

end