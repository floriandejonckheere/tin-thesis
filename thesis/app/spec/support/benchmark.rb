require 'benchmark'

# Number of iterations to perform
ITERATIONS = [
  1_000,
  # 10_000,
  # 100_000,
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
  ITERATIONS.each do |iteration|
    COUNT.each do |count|
      it "executes #{iteration} iterations with limit #{count}" do
        b = Benchmark.measure do
          iteration.times { block.call }
        end

        puts 'it = %8s, co = %4s, ti = %3ss' % [iteration, count, b.real.round(2)]
      end
    end
  end
end
