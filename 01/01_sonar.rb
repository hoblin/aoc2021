measurements = File.read("01/measurements.txt").split.map(&:to_i)
dives_count = 0
measurements.inject do |memo, num|
  dives_count += 1 if memo && memo < num
  num
end
pp dives_count
