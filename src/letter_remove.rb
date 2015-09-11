require 'benchmark/ips'

BASE_STRING = 'this is really just a test to satisfy my curiosity about which lib methods are faster'

def array_diff
  (BASE_STRING.chars - %w(a e i o u)).join
end

def string_delete
  BASE_STRING.delete('aeiou')
end

puts "same result?: #{ array_diff == string_delete }"

Benchmark.ips do |x|
  x.report('array diff') do
    array_diff
  end
  x.report('string delete') do
    string_delete
  end
  x.compare!
end
