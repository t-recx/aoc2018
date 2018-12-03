#!/usr/bin/env ruby

frequency  = ''

File.readlines(ARGV[0]).each { |line| frequency = eval(frequency + line).to_s }

puts frequency
