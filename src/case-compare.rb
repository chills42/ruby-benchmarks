require 'benchmark/ips'

a, b = 'HeLlO World', 'HELLO world'

Benchmark.ips do |x|
  x.report('downcase') do
    a.downcase == a.downcase
  end
  x.report('upcase') do
    a.upcase == b.upcase
  end
  x.report('casecmp') do
    a.casecmp(b) == 0
  end
  x.compare!
end
