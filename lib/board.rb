#!/usr/bin/env ruby
# frozen_string_literal: true

# instantiates fields fields for a chess board as nodes
# occupier attribute to keep track of pieces on each field
class Field
  attr_reader :color
  attr_accessor :occupier

  def initialize(occupier = nil, color = nil)
    @occupier = occupier
    @color = color
  end
end

# instantiates the board for a chess game
class Board
  attr_reader :fields

  def initialize
    @fields = {}
    8.times do |i|
      8.times do |j|
        @fields[[i, j]] = Field.new(nil, ((i + j).even? ? 'b' : 'w'))
      end
    end
    fields
  end
end
