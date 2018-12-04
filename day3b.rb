#!/usr/bin/env ruby

def collide(a, b)
  not (b[:x] > a[:x] + a[:w] || b[:x] + b[:w] < a[:x] || b[:y] > a[:y] + a[:h] || b[:y] + b[:h] < a[:y])
end

patches = {}

File.readlines(ARGV[0]).each do |line|
  tokens = line.split ' '
  x, y = tokens[2].split(',').map { |e| e.to_i }
  w, h = tokens[3].split('x').map { |e| e.to_i }
  
  patches[tokens[0]] = { x: x, y: y, w: w, h: h }
end

puts patches.select { |k1, a| patches.reject { |k2| k1 == k2 }.all? { |k2, b| not collide(a, b) } }
