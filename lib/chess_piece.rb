#!/usr/bin/env ruby
# frozen_string_literal: true

# parent class for all chess pieces with common methods
class ChessPiece
  attr_accessor :coord, :targets, :creator

  def initialize(coord = [0, 0], creator = 'root')
    @coord = coord
    @pattern = pattern
    @creator = creator
    @targets = possible_moves
  end

  def possible_moves(start = coord, proc = pattern)
    targets = []
    proc.call(start, targets)
    targets.reject { |e| invalid?(e) }
  end

  def find_path(target)
    queue = [self]
    until (move = queue.shift).targets.include? target
      move.targets.each { |coord| queue << Knight.new(coord, move) }
      queue = clean_queue(queue, target, move.targets.size * -1)
    end
    return_path(target, move)
  end

  def return_path(target, move)
    path = [target, move.coord]
    until move.creator == 'root'
      path << move.creator.coord
      move = move.creator
    end
    path
  end

  def clean_queue(queue, target, new_objects)
    has_target = nil
    queue[new_objects..-1].each_with_index do |k, i|
      if k.targets.include? target
        has_target = k
        queue.delete_at(i)
      end
      break if has_target
    end
    queue = (has_target ? queue.unshift(has_target) : queue).uniq(&:coord)
  end

  def invalid?(coord)
    return true unless coord.is_a?(Array) && coord.size == 2

    coord.each { |i| (return true) if i.negative? || i > 7 }
    false
  end

  def pattern
    proc do
      puts 'no piece specified'
    end
  end
end
