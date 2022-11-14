require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ("A".."Z").to_a.sample }
    return @letters
  end

  def english_word
    url = "https://wagon-dictionary.herokuapp.com/#{@answer.downcase}"
    word_dictionary = URI.open(url).read
    word = JSON.parse(word_dictionary)
    return word["found"]
  end

  def grids
    @answer.chars.sort.all? { |letter| @grid.include?(letter) }
  end

  def score
    @grid = params[:grid]
    @answer = params[:word]
    grid_letters = @grid.each_char { |letter| print letter, ''}
    if !grids
      @result = "Sorry, but #{@answer.upcase} cant be built out of #{grid_letters}."
    elsif !english_word
      @result = "Sorry but #{@answer.upcase} does not seem to be an English word."
    elsif grids && !english_word
      @result = "Sorry but #{@answer.upcase} does not seem to be an English word."
    else grids && english_word
      @result = "Congratulation! #{@answer.upcase} is a valid English word."

    end
  end
end
