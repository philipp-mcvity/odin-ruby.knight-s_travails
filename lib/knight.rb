#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'chess_piece.rb'

# instantiates the knight-pieces for chess games and specifies their behaviour
class Knight < ChessPiece
  def knight_moves(target, start = (no_start = true))
    return nil if invalid?(target) || (invalid?(start) unless no_start)

    move_to(start) unless no_start
    path = find_path(target)
    "#{coord} to #{target} is possible in #{path.size - 1} moves:\n
#{path.reverse.map(&:to_s).join(' -> ')}"
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  private

  def move_to(field)
    self.coord = field
    self.targets = possible_moves
  end

  def pattern
    proc do |start, targets, a = [1, -1], b = [2, -2]|
      2.times do
        a.each do |n|
          b.each { |m| targets << [start.first + n, start.last + m] }
        end
        a, b = b, a
      end
      targets
    end
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
end
