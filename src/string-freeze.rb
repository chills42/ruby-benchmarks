require 'benchmark/ips'

CONSTANT_STRING = 'string'
CONSTANT_FROZEN = 'string'.freeze

Benchmark.ips do |x|
  x.config(time: 5, warmup: 2)

  x.report('string') do
    'string' == 'string'
  end

  x.report('frozen string') do
    'string'.freeze == 'string'.freeze
  end

  x.report('symbol') do
    'string' == :string.to_s
  end

  x.report('constant string') do
    'string' == CONSTANT_STRING
  end

  x.report('constant frozen string') do
    'string' == CONSTANT_FROZEN
  end
  x.compare!
end
