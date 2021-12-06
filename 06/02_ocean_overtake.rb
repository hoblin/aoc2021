require 'rubygems'
require 'bundler/setup'
require 'ruby-progressbar'
LIFETIME = 256

$tribe = File.read('06/input.txt').chomp.split(',').map(&:to_i)

progressbar = ProgressBar.create(total: LIFETIME)
LIFETIME.times do
  $tribe.map! do |i|
    i -= 1
    if i < 0
      $tribe << 9
      6
    else
      i
    end
  end
  progressbar.increment
end
p 'Result:', $tribe.size
