require "rubygems"
require "bundler/setup"
require "awesome_print"

course = File.read("02/input.txt").gsub("up ", "-").gsub("down ", "").split("\n")
forward_proc = proc { |row| row.match?(/forward \d/) }
ap course.filter(&forward_proc).map { |row| row.sub(/.+ /, "").to_i }.sum * course.delete_if(&forward_proc).map(&:to_i).sum
