class Game
  attr_accessor :word, :guesses, :turns_remaining

  def initialize
    # self.word = choose_word
    self.word = 'test'
    self.guesses = Array.new(word.length, '_')
    self.turns_remaining = 6
  end

  # Runs the game until player wins or loses
  # def game_loop
  #   while turns_remaining.positive? && guesses.include?('_')
  #     puts 'Please enter your guess'
  #     user_input = gets.chomp

  #     # `hits` refers to the indexes of correct guesses
  #     hits = check_guess(user_input)

  #     if hits.length.positive?
  #       hits.each do |i|
  #         guesses[i] = user_input
  #       end
  #       puts 'Success!'
  #     else
  #       turns_remaining -= 1
  #       puts "You have #{turns_remaining} turns left."
  #     end

  #     puts guesses.join(' ')
  #   end
  # end

  private

  # Chooses the word that will be used for the game
  def choose_word
    file = File.open('public/google-10000-english-no-swears.txt')
    word_list = file.readlines.map(&:chomp).select { |word| word.length >= 5 && word.length <= 12 }
    word_list[rand(0..word_list.length - 1)]
  end

  # Checks if guess is in word and returns indexes if it is
  def check_guess(char)
    indexes = []
    word.chars.each_with_index do |c, i|
      indexes.push(i) if c == char
    end
    indexes
  end
end

game = Game.new

# puts game.word
# puts game.guesses.join(' ')
# puts game.accept_guess('p')
game.game_loop
