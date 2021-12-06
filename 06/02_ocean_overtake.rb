require 'rubygems'
require 'bundler/setup'
require 'ruby-progressbar'

LIFETIME = 256

Tribe = Struct.new(:tribe) do
  def initialize(tribe_array)
    # Instead of tracking each fish individually,
    # we can store the amount by delay left.
    self.tribe = []
    8.times { |i| tribe[i] = 0 }
    tribe_array.map { |i| tribe[i] += 1 }
  end

  def tick
    updated_tribe = []
    8.times do |index|
      updated_tribe[index] = tribe[index + 1].to_i
    end
    updated_tribe[6] += tribe[0]
    updated_tribe[8] = tribe[0] + (updated_tribe[8] || 0)
    self.tribe = updated_tribe
  end
end

tribe = Tribe.new File.read('06/input.txt').chomp.split(',').map(&:to_i)

LIFETIME.times { tribe.tick }
p 'Result:', tribe.tribe.sum
