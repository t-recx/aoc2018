#!/usr/bin/env ruby

def get_box_id(lines)
  lines.each do |first_line|
    lines.select { |line| line != first_line }.each do |second_line|
      count_differences = 0
      common_chars = ''

      first_line.length.times do |i|
        if (first_line[i] != second_line[i])
          count_differences += 1 
        else
          common_chars += first_line[i]
        end

        break if count_differences > 1
      end

      return common_chars if (count_differences == 1)
    end
  end
end

puts get_box_id(File.readlines(ARGV[0]))
