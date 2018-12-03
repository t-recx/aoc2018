#!/usr/bin/env ruby

frequencies = []
frequency  = ''

lines = File.readlines(ARGV[0])

until frequencies.count(frequency) > 1
  lines.each do |line|
    frequency = eval(frequency + line).to_s

    frequencies.push(frequency)

    break if frequencies.count(frequency) > 1
  end
end

puts frequency
