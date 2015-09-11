require 'benchmark/ips'

a = 1..100

def v1(arr)
  arr.reject { |b| b.odd? }
end

def v2(arr)
  arr.select { |b| !b.odd? }
end

def v3(arr)
  arr.reject(&:odd?)
end

puts v1(a) == v2(a) && v1(a) == v3(a)

Benchmark.ips do |x|
  x.report('reject') { v1(a) }
  x.report('select not') { v2(a) }
  x.report('reject proc') {v3(a) }
  x.compare!
end
