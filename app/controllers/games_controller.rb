require 'open-uri'

class GamesController < ApplicationController
  def store_score(score)
    session[:score].nil? ? session[:score] = 0 : session[:score] += score
  end

  def remove_score
    session.delete(:score)
  end

  def new
    alpha = ('a'..'z').to_a
    @letters = []
    10.times { @letters.push(alpha.slice!(rand(alpha.length), 1).join) }
    @score = session[:score]
  end

  def score
    letters = params[:letters]
    answer = params[:answer].split('')
    check_array = []
    score = 0

    answer.each do |x|
      if letters.include?(x)
        check_array.push(x)
      end
    end

    url = "https://wagon-dictionary.herokuapp.com/#{answer.join}"
    parse = JSON.parse(URI.open(url).read)
    check = parse['found']

    if check_array.sort == answer.sort && check == true
      @output = "Congratulations! #{answer.join.capitalize} is correct!"
      score = answer.length * answer.length
    elsif check == false
      @output = "Sorry, #{answer.join.capitalize} is not in the dictionary"
    elsif check_array.sort == answer.sort
      @output = "Sorry, #{letters.join.capitalize} does not contain #{answer.join.capitalize}"
    end

    store_score(score)
  end
end
