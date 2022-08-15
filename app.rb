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

  def next_state(neighbors)
    @next_state = :dead
    @next_state = :alive if neighbors == 3
    @next_state = :alive if neighbors.between?(2, 3)
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

  def check_neighbors(col, row)
    neighbors = 0
    directions = [
      [col - 1, row - 1], # upper left neighbor
      [col, row - 1], # upper middle
      [col + 1, row - 1], # upper right
      [col - 1, row], # left
      [col + 1, row], # right
      [col - 1, row + 1], # bottom left
      [col, row + 1], # bottom middle
      [col + 1, row + 1] # bottom right
    ]

    directions.each do |col, row|
      if col >= 0 && col < @array.length && row >= 0 && row < @array[col].length && @array[col][row].alive?
        neighbors += 1
      end
    end
  end

  def new_grid
    @grid.each do |element|
      element.each do |cell|
        cell.next_state(check_neighbors(cell.col, cell.row))
      end
    end
  end
end

class Game
  def initialize
    puts 'Ingresa el número de columnas'
    @column = gets.chomp.to_i
    puts 'Ingresa el número de filas'
    @row = gets.chomp.to_i
    @grid = Grid.new(@column, @row)
    @grid.print_grid
  end
end

Game.new
