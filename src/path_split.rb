require 'benchmark/ips'
require 'memory_profiler'

@path = '/expected/path/string/whoo'

def split_path
  @path.split('/')[1]
end

def limited_split_path
  @path.split('/', 3)[1]
end

def slice_section
  @path[/\/(.*?)\//, 1]
end

report = MemoryProfiler.report do
  split_path
end

report.pretty_print

report = MemoryProfiler.report do
  limited_split_path
end

report.pretty_print

report = MemoryProfiler.report do
  slice_section
end

report.pretty_print

@path = '/health/check/for/it'

ALLOWED_ROOT_PATHS = %w(cic health twilio dashboard tentacle)
p ALLOWED_ROOT_PATHS.include? split_path
p ALLOWED_ROOT_PATHS.include? limited_split_path

Benchmark.ips do |x|
  x.report('string split') do
    split_path
  end
  x.report('limited split') do
    limited_split_path
  end
  x.report('slice section') do
    slice_section
  end
  x.compare!
end
