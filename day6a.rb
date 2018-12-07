#!/usr/bin/env ruby

require 'matrix'

def distance x0, x1, y0, y1
  (x0 - x1).abs + (y0 - y1).abs
end

elements = []
lines = File.readlines(ARGV[0])

lines.each_with_index do |line, i| 
  x, y = line.split(',').map(&:to_i)
  elements.push({ id: i, x: x, y: y })
end

min_x, min_y = [elements.map { |e| e[:x] }.min, elements.map { |e| e[:y] }.min] 

elements.each do |e| 
  e[:x] -= min_x
  e[:y] -= min_y
end

width, height = [elements.map { |e| e[:x] }.max, elements.map { |e| e[:y] }.max] 

a = []

height.times do |y|
  a.push Array.new(width)
end

height.times do |y|
  width.times do |x|
    distances = elements
      .map { |e| { id: e[:id], distance: distance(e[:x], x, e[:y], y) } }

    a[y][x] = distances[0][:id] unless distances[0][:distance] == distances[1][:distance]
  end
end

m = Matrix[*a]

excluded_ids = []
excluded_ids += a[0].uniq
excluded_ids += a[-1].uniq
excluded_ids += m.column(0).to_a
excluded_ids += m.column(-1).to_a

a = a.flatten.select { |e| excluded_ids.none? { |id| id == e } }

puts a.uniq.map { |id| {id: id, count: a.select { |x| x == id }.count  } }.sort_by { |e| -e[:count] }.first[:count]
