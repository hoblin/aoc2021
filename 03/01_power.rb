require 'rubygems'
require 'bundler/setup'
require 'awesome_print'

counter = []
readings = File.read('03/input.txt').split
readings.each do |line|
  readings = line.gsub(/(.)/, '\1|').gsub('0', '-1').split('|')
  readings.each_with_index { |bit, index| counter[index] = bit.to_i + (counter[index] || 0) }
end
gamma = ''
epsilon = ''
counter.map do |i|
  gamma << (i.positive? ? '1' : '0')
  epsilon << (i.positive? ? '0' : '1')
end
ap gamma.to_i(2) * epsilon.to_i(2)
