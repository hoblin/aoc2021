require 'rubygems'
require 'bundler/setup'
require 'awesome_print'
require 'bresenham'
require 'ascii_plot'
require 'ruby-progressbar'

line_points_set = Bresenham::Line.coordinates(0, 0, 3, 10)
Line = Struct.new(:input, :coordinates)

input = File.read('05/input.txt').split("\n")
lines = input.map do |line_input|
  tuples = line_input.split(/[^\d]+/).map(&:to_i)
  # And now i can just comment it =)
  # next if tuples[0] != tuples[2] && tuples[1] != tuples[3]
  Line.new line_input, Bresenham::Line.coordinates(*tuples)
end.compact

all_dots = []
collect_progress = ProgressBar.create(total: lines.size)
lines.each do |line|
  all_dots = all_dots += line.coordinates.to_a.map { |coord| coord.join('.').to_sym }
  collect_progress.increment
end

uniq_dots = all_dots.uniq
progressbar = ProgressBar.create(total: uniq_dots.size)
uniq_dots.each do |dot|
  first_entry_index = all_dots.index(dot)
  all_dots.delete_at(first_entry_index)
  progressbar.increment
end
p 'Result:', all_dots.uniq.size
