#!/usr/bin/env ruby

lines = File.readlines(ARGV[0])
count_twice = 0
count_thrice = 0

lines.each do |line|
  char_counts = {}

  line.chars.uniq.each { |char| char_counts[char] = line.count(char) }

  count_twice += 1 if (char_counts.keys.any? { |c| char_counts[c] == 2 })
  count_thrice += 1 if (char_counts.keys.any? { |c| char_counts[c] == 3 })
end

puts count_twice * count_thrice
