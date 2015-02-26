require 'benchmark/ips'

a,b,c,d = ['asdfasdfasdfasdfasdfasdfasdfasdfasdfasdf','asdfasdfasdfasdfasdfasdfasdfasdf','sadfg','asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf']

prep = "#{a}#{b}REPLACEMENT#{d}"
Benchmark.ips do |x|
  x.config(:time => 5, :warmup => 2)
  x.report("interp-full") do
    "#{a}#{b}#{c}#{d}"
  end
  x.report("interp plus sub") do
    prep.sub('REPLACEMENT',c)
  end
  x.compare!
end
