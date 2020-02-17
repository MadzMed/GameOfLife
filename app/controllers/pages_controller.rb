require_relative '../models/game.rb'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :play]

  def home
    @positions = ["1,4","1,5","2,3","2,4","2,5","2,6"]
  end

  def play
    @matrix = Game.new([[0, 0, 0, 0], [0, 0, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0]], 1).matrix.matrix
  end
end
