require "rubygems"
require "bundler/setup"
require "awesome_print"

Card = Struct.new(:card, :rows, :numbers) do
  def initialize(string)
    self.card = string.chomp
    self.numbers = card.split(/[^\d]+/)
    card_rows = card.split("\n").map(&:split)
    card_columns = card_rows.transpose
    self.rows = card_rows + card_columns
  end

  def bingo?(winners)
    rows.any? { |row| row - winners == [] }
  end
end

input = File.read("04/input.txt").split(/^\n/)
winners_input = input.delete_at(0).chomp.split(",")
cards = input.map { |raw_card| Card.new(raw_card) }
winner = nil
winners_input.size.times do |index|
  turn_winners = winners_input[0..index]
  winner = cards.find { |card| card.bingo?(turn_winners) }
  next unless winner

  unmarked = winner.numbers - turn_winners
  puts "Winner:", winner.card
  puts "\nUnmarked:", unmarked.join(" ")
  puts "\nResult: ", unmarked.map(&:to_i).sum * turn_winners.last.to_i
  break
end
