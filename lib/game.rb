class Game
  attr_accessor :word

  def initialize; end

  private

  def choose_word
    file = File.open('public/google-10000-english-no-swears.txt')
    file.readlines.map(&:chomp).select { |word| word.length >= 5 && word.length <= 12 }
  end
end

game = Game.new

game.choose_word
