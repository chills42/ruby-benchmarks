require 'benchmark/ips'

EXAMPLES = %w(stacey.james staging.user ADMIN_stewartG 33AdminC ronP jack.stride_tag)

def regex_filters
  EXAMPLES.reject do |name|
     name.match(/Admin/i) || name.match(/tag$/)
  end
end

def string_methods
  EXAMPLES.reject do |name|
    name.downcase.include?('admin') || name.end_with?('tag')
  end
end

p regex_filters
p string_methods
puts "methods match?: #{regex_filters == string_methods}"


Benchmark.ips do |x|
  x.report('regex match') do
    regex_filters
  end
  x.report('string methods') do
    string_methods
  end
  x.compare!
end
