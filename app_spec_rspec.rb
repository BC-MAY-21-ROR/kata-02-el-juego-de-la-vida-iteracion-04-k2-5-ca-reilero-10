# frozen_string_literal: true

require 'rspec'
require_relative './app.rb'


describe Cell do 
    describe '#initialize' do
        it 'verifies the life status of a cell' do
            expect(Cell.new(:alive, 5, 2).to_s).to eq('*')
        end
    end
end