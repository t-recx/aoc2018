#!/usr/bin/env ruby

def collide(a, b)
  not (b[:x] > a[:x] + a[:w] || b[:x] + b[:w] < a[:x] || b[:y] > a[:y] + a[:h] || b[:y] + b[:h] < a[:y])
end

patches = {}

File.readlines(ARGV[0]).each do |line|
  tokens = line.split ' '
  positions = tokens[2].split(',').map { |e| e.to_i }
  sizes = tokens[3].split('x').map { |e| e.to_i }
  
  patches[tokens[0]] = { x: positions[0], y: positions[1], w: sizes[0], h: sizes[1] }
end

puts patches.select { |k1, a| patches.select { |k2, b| a != b }.all? { |k2, b| not collide(a, b) } }
