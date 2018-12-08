#!/usr/bin/env ruby

steps = File.readlines(ARGV[0]).map {|l| l.split(' ') }.map { |t| [t[1], t[7]] }

requirements = {}

steps.each do |requirement, step|
  requirements[step] = [] unless requirements[step]
  requirements[step].push requirement
end

steps.select { |x| requirements.keys.none? { |k| k == x[0] } }.map { |x| x[0] }.each { |step| requirements[step] = [] }

while next_step = requirements.select { |k,v| v.count == 0 }.sort.map { |x| x[0] }.first do
  requirements.each { |k, v| v.delete next_step }

  requirements.delete(next_step)

  putc next_step
end
