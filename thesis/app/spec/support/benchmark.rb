require 'benchmark'

# Number of iterations to perform
ITERATIONS = [
    1_000,
    10_000,
# 100_000,
# 1_000_000,
].freeze

# Count of queried events
COUNT = [
    100,
# 1_000,
# 10_000,
].freeze

##
# Execute block benchmark according to parameters
#
def benchmark(&block)
  results = {}

  ITERATIONS.each do |iteration|
    results[iteration] = {}

    COUNT.each do |count|
      b = Benchmark.measure do
        iteration.times { block.call }
      end

      results[iteration][count] = b.real
    end
  end

  results.each do |iterations, count_h|
    count_h.each do |count, time|
      puts "it = #{iterations}, co = #{count}, ti = #{time}"
    end
  end
end
