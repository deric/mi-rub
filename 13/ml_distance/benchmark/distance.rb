require 'benchmark'
require 'ml_distance'

# Usage:
#
#  with gnuplot chart (requires `gem install gnuplot`)
#
#  $ ruby plot.rb
#
# just benchmark:
#
#  $ ruby run.rb
#

# pure ruby implementation

# Returns the Euclidean distance between 2 points
#
# Params:
#  - a, b: list of coordinates (float or integer)
#
def euclidean_distance(a, b)
  sq = a.zip(b).map{|a,b| (a - b) ** 2}
  Math.sqrt(sq.reduce(0) {|s,c| s + c})
end

def run(data)
  bench = {}
  Benchmark.bm do |x|
    bench["pure ruby"] = x.report("pure ruby") do
      first = data.first
      data.each do |v|
        euclidean_distance(first, v)
      end
    end
    bench["native C"] = x.report("native C") do
      first = data.first
      data.each do |v|
        first.euclidean(v)
      end
    end
  end
  bench
end