#!/usr/bin/env ruby

Letters = ('a'..'z').to_a
Combinations = Letters.map { |c| [c + c.upcase, c.upcase + c] }

def react line
  while line.gsub! /#{Combinations.join ?|}/, ''; end

  line
end

input = File.open(ARGV[0], &:gets)

p Letters.map { |c| [c, c.upcase] }.map { |c| react(input.gsub(/#{c.join ?|}/, '')).length - 1 }.sort.first
