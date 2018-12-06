#!/usr/bin/env ruby

line = File.open(ARGV[0], &:gets)
combinations = ('a'..'z').to_a.map { |c| [c + c.upcase, c.upcase + c] }

while line.gsub! /#{combinations.join ?|}/, ''; end

p line.length - 1
