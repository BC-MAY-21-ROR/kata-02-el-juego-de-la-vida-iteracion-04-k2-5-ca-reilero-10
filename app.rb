# frozen_string_literal: true

class Cell
  attr_accessor :state

  def initialize(state, row, col)
    @state = state
    @row = row
    @col = col
  end

  def to_s
    @state == :alive ? '*' : '.'
  end

  def next_state_to_s
    @next_state == :alive ? '*' : '.'
  end

  def alive?
    @state == :alive
  end

  def alive!
    @state = :alive
  end

  def dead!
    @state = :dead
  end

  attr_reader :col, :row

  def next_state(neighbors)
    @next_state = :dead
    @next_state = :alive if neighbors == 3
    @next_state = :alive if neighbors.between?(2, 3)
  end
end

class Grid
  attr_accessor :column, :row

  def initialize(row, column)
    @grid = Array.new(row) do
      Array.new(column) do
        rand(1...100).between?(70, 100) ? Cell.new(:alive, row, column) : Cell.new(:dead, row, column)
      end
    end
  end

  def print_grid
    puts 'Old Grid'
    @grid.each do |row|
      row.each do |cell|
        print cell.to_s
      end
      puts
    end
  end

  def check_neighbors(row, col)
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

    directions.each do |cols, rows|
      if cols >= 0 && cols < @grid.length && rows >= 0 && rows < @grid[cols].length && @grid[rows][cols].alive?
        neighbors += 1
      end
    end
    neighbors
  end

  def new_grid
    fil = 0
    @grid.each do |element|
      col = 0
      element.each do |cell|
        cell.next_state(check_neighbors(fil, col))

        col += 1
      end
      fil += 1
    end
  end

  def print_new_grid
    puts 'New Grid'
    @grid.each do |row|
      row.each do |cell|
        print cell.next_state_to_s
      end
      puts
    end
  end
end

class Game
  def initialize
    puts 'Ingresa el número de columnas'
    @column = gets.chomp.to_i
    puts 'Ingresa el número de filas'
    @row = gets.chomp.to_i
    @grid = Grid.new(@row, @column)
    @grid.print_grid
    @grid.new_grid
    @grid.print_new_grid
  end
end

Game.new
