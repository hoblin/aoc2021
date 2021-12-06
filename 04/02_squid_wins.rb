require "rubygems"
require "bundler/setup"
require "awesome_print"
# in terms of man/hours it's easier to base solution on the first puzzle.
# But in terms ot computer/hours it's better to start checking
# from all winning numbers and delete one by one
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

  def result(winners)
    unmarked = numbers - winners
    unmarked.map(&:to_i).sum * winners.last.to_i
  end
end

input = File.read("04/input.txt").split(/^\n/)
winners_input = input.delete_at(0).chomp.split(",")
cards = input.map { |raw_card| Card.new(raw_card) }

looser = nil
winners_input.size.times do |index|
  turn_index = winners_input.size - index
  turn_winners = winners_input[0..turn_index]

  looser = cards.find { |card| !card.bingo?(turn_winners) }
  next unless looser

  puts "Looser:", looser.card
  puts "\nResult: ", looser.result(winners_input[0..turn_index + 1])
  break
end
