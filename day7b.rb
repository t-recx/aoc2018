#!/usr/bin/env ruby

steps = File.readlines(ARGV[0]).map {|l| l.split(' ') }.map { |t| [t[1], t[7]] }

requirements = {}

steps.each do |requirement, step|
  requirements[step] = [] unless requirements[step]
  requirements[step].push requirement
end

steps.select { |x| requirements.keys.none? { |k| k == x[0] } }.map { |x| x[0] }.each { |step| requirements[step] = [] }

second = 0
workers = { 0 => [-1, ''], 1 => [-1, ''], 2 => [-1, ''], 3 => [-1, ''], 4 => [-1, ''] }

loop do
  loop do
    available = requirements.select { |k,v| v.count == 0 }.sort.map { |x| x[0] }

    next_step = available.first

    if next_step 
      worker_key = workers.select { |k, v| v[0] <= 0 }.keys.first

      if worker_key
        step_completed = workers[worker_key][1]

        requirements.delete(next_step)

        workers[worker_key] = [60 + (next_step.ord - 'A'.ord) + 1, next_step]
      else
        break
      end
    else
      break
    end
  end

  workers.each { |k, v| workers[k][0] -= 1 }

  workers.select { |k, v| v[0] <= 0 }.each { |wk, wv| requirements.each { |k, v| v.delete wv[1] } }

  second += 1

  break if workers.all? { |k, v| v[0] <= 0 } and requirements.length == 0
end

puts second
