#!/usr/bin/env ruby

def get_node tokens
  cn, mn = tokens.shift 2

  child_nodes = []

  while cn > 0
    child_nodes.push get_node(tokens)

    cn -= 1
  end

  { metadata: tokens.shift(mn), childs: child_nodes }
end

def get_metadata_sum node
  if node
    if node[:childs].length == 0
      return node[:metadata].sum 
    else
      return node[:metadata].map { |e| get_metadata_sum (node[:childs][e - 1]) }.sum
    end
  end

  return 0
end

nodes = get_node(File.readlines(ARGV[0]).first.split(' ').map(&:to_i))

p get_metadata_sum nodes
