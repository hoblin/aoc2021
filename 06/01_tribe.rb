require "ruby-progressbar"

Fish = Struct.new(:spawn_delay) do
  def tick
    self.spawn_delay -= 1
    if spawn_delay < 0
      $tribe << Fish.new(9)
      self.spawn_delay = 6
    end
  end
end

$tribe = File.read("06/input.txt").chomp.split(",").map(&:to_i).map { |delay| Fish.new(delay) }

progressbar = ProgressBar.create(total: 80)
80.times do
  $tribe.map(&:tick)
  progressbar.increment
end
p "Result:", $tribe.size
