require "ruby-progressbar"
module Enumerable
  def get_fuel(pos)
    sum { |position, amount| (position - pos).abs * amount }
  end
end

crabs = File.read("07/input.txt").chomp.split(",").map(&:to_i)

crabs_by_position = crabs.each_with_object({}) { |i, memo| memo[i] = 1 + (memo[i] || 0) }
min_position = crabs_by_position.keys.min
max_position = crabs_by_position.keys.max

progressbar = ProgressBar.create(total: max_position - min_position + 1)

best_position = (min_position..max_position).min_by do |pos|
  progressbar.increment
  crabs_by_position.get_fuel(pos)
end

p "Best position:", best_position, "Fuel needed", crabs_by_position.get_fuel(best_position)
