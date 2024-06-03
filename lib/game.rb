class Game
  attr_accessor :word, :guesses, :turns_remaining

  def initialize
    self.word = choose_word
    self.guesses = Array.new(word.length, '_')
    self.turns_remaining = 6
  end

  private

  def choose_word
    file = File.open('public/google-10000-english-no-swears.txt')
    word_list = file.readlines.map(&:chomp).select { |word| word.length >= 5 && word.length <= 12 }
    word_list[rand(0..word_list.length - 1)]
  end
end

game = Game.new

# puts game.word
# puts game.guesses.join(' ')
