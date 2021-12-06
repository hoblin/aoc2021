measurements = File.read("01/measurements.txt").split.map(&:to_i)
dives_count = 0
memo = nil
measurements.length.times do |index|
  sum = measurements[index..index + 2].sum
  dives_count += 1 if memo && memo < sum
  memo = sum
end
pp dives_count
