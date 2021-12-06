LIFETIME = 256

Tribe = Struct.new(:school) do
  def initialize(tribe_array)
    # Instead of tracking each fish individually,
    # we can store the amount by delay left.
    self.school = []
    8.times { |i| school[i] = 0 }
    tribe_array.map { |i| school[i] += 1 }
  end

  def tick
    updated_school = []
    8.times do |index|
      updated_school[index] = school[index + 1].to_i
    end
    updated_school[6] += school[0]
    updated_school[8] = school[0] + (updated_school[8] || 0)
    self.school = updated_school
  end
end

tribe = Tribe.new File.read("06/input.txt").chomp.split(",").map(&:to_i)

LIFETIME.times { tribe.tick }
p "Result:", tribe.school.sum
