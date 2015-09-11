require 'benchmark/ips'

Benchmark.ips do |x|
  x.report('native') do
    1 == 0
  end
  x.report('zero?') do
    1.zero?
  end
  x.compare!
end
