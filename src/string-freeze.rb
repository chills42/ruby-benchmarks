require 'benchmark/ips'
require 'memory_profiler'

EXAMPLE = { 'hello' => 'world', 'second' => 'item' }
HELLO = 'hello'.freeze

def basic_string_test
  5.times { EXAMPLE['hello'] }
end

def constant_string_test
  5.times { EXAMPLE[HELLO] }
end

puts "Test: #{basic_string_test == constant_string_test}"

report = MemoryProfiler.report do
  basic_string_test
end

report.pretty_print

report = MemoryProfiler.report do
  constant_string_test
end

report.pretty_print

Benchmark.ips do |x|
  x.config(time: 5, warmup: 2)

  x.report('string') do
    basic_string_test
  end

  x.report('frozen string') do
    constant_string_test
  end
  x.compare!
end
