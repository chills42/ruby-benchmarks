require 'benchmark/ips'
require 'set'

a = (0..100).to_a
b = []
1000.times { b << a.sample }

puts b.uniq == Set.new(b).to_a

Benchmark.ips do |x|
  x.report('enumerable uniq') do
    b.uniq
  end
  x.report('set.to_a') do
    Set.new(b).to_a
  end
  x.compare!
end
