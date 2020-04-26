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
    end
    path = [target, move.coord]
    until move.creator == 'root'
      path << move.creator.coord
      move = move.creator
    end
    path
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
