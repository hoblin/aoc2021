require "rubygems"
require "bundler/setup"
require "awesome_print"

# Dirty and ugly but works
def common_bit_at(pos, lines)
  one = lines.filter { |line| line[pos] == "1" }
  zero = lines.filter { |line| line[pos] == "0" }
  one.size < zero.size ? zero : one
end

def uncommon_bit_at(pos, lines)
  one = lines.filter { |line| line[pos] == "1" }
  zero = lines.filter { |line| line[pos] == "0" }
  zero.size <= one.size ? zero : one
end

generator = 0
scrubber = 0
readings = File.read("03/input.txt").split
filtered = readings
readings.first.length.times do |i|
  filtered = common_bit_at(i, filtered)
  if filtered.size == 1
    generator = filtered[0]
    break
  end
end

filtered = readings
readings.first.length.times do |i|
  filtered = uncommon_bit_at(i, filtered)
  if filtered.size == 1
    scrubber = filtered[0]
    break
  end
end

ap generator.to_i(2) * scrubber.to_i(2)
