require 'rubygems'
require 'bundler/setup'
require 'awesome_print'

measurements = File.read('01/measurements.txt').split.map(&:to_i)
dives_count = 0
memo = nil
measurements.each_with_index do |_num, index|
  sum = measurements[index..index + 2].sum
  dives_count += 1 if memo && memo < sum
  memo = sum
end
ap dives_count
