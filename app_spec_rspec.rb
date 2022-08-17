# frozen_string_literal: true

require 'rspec'
require_relative './app'

describe Cell do
  describe '#initialize' do
    it 'verifies that the alive cell is represented by an asterisk' do
      expect(Cell.new(:alive, 5, 2).to_s).to eq('*')
    end
    it 'verifies that the dead cell is represented by a dot' do
      expect(Cell.new(:dead, 5, 2).to_s).to eq('.')
    end
  end
end
