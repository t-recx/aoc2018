#!/usr/bin/env ruby

id = 0

puts File.readlines(ARGV[0]).map { |line| line.split(/[\s,\-,:]/) }.sort_by { |x| x[1..4].map(&:to_i) }.map { |x| id = x[6] if x[6].start_with? '#'; [id] + x  }.select { |x| x.count == 8 }.each_slice(2).map {|x| [x[0][0][1..-1].to_i, (x[0][5].to_i..x[1][5].to_i).to_a]  }.group_by { |x| x[0] }.map { |k, v| [k, v.inject([]) { |a, b| a + b.last }] }.map { |x| [x[0], x[1].uniq.map { |y| [y, x[1].count(y)] } ] }.map { |x| { id: x[0], total: x[1].sum { |y| y[1] }, minute: x[1].sort_by { |y| -y[1] }[0].first } }.sort_by { |x| -x[:total] }.map { |x| x[:id] * x[:minute] }.first
