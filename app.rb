# frozen_string_literal: true

class Cell
  attr_accessor :state

  def initialize
    @state = string
  end

  def string
    @state == :alive ? '*' : '.'
  end

  def alive?
    @state == alive
  end

  def alive!
    @state = alive
  end

  def dead!
    @state = dead
  end
end

class Grid
  attr_accessor :column, :row

  def initialize(row, column)
    @grid = Array.new(row, Array.new(column) { Cell.new.string })
  end

  def print_grid
    @grid.each do |row|
      puts row.join(' ')
    end
  end
end

grid_instance = Grid.new(5, 5)
grid_instance.print_grid
