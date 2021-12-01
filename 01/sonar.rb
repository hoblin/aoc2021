require 'rubygems'
require 'bundler/setup'
require 'awesome_print'

measurements = File.read('01/measurements.txt').split.map(&:to_i)
dives_count = 0
measurements.inject do |memo, num|
  dives_count += 1 if memo && memo < num
  memo = num
end
ap dives_count
