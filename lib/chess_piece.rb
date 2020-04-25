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
