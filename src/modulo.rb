require 'benchmark/ips'

a = 1..10

Benchmark.ips do |x|
  x.report('mod symbol') do
    a.each { |b| b % 5 == 0 }
  end
  x.report('mod symbol call') do
    a.each { |b| b.%(5) == 0}
  end
  x.report('modulo method') do
    a.each { |b| b.modulo(5) == 0 }
  end
  x.compare!
end
