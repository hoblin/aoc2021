course = File.read("02/input.txt").gsub("up ", "-").gsub("down ", "").split("\n")
aim = 0
x = 0
y = 0
course.each do |command|
  if command.match?(/forward \d/)
    increase = command.sub(/.+ /, "").to_i
    x += increase
    y += increase * aim
  else
    aim += command.to_i
  end
end
pp x * y
