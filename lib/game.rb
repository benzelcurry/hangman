class Game
  attr_accessor :word, :guesses, :turns_remaining

  # TODO: Add an array for checking if user has already tried out a letter

  def initialize
    self.word = choose_word
    self.guesses = Array.new(word.length, '_')
    self.turns_remaining = 6
  end

  # Runs the game until player wins or loses
  def game_loop
    while turns_remaining.positive? && guesses.include?('_')
      puts 'Please enter your guess'
      user_input = gets.chomp
      correct_guesses = check_guess(user_input)

      update_game(correct_guesses, user_input)

      puts guesses.join(' ')
      puts "\n"
    end

    inform_win_status
  end

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

  # Informs user and updates game state if guess is correct/wrong
  def update_game(correct_guesses, user_input)
    if correct_guesses.length.positive?
      correct_guesses.each do |i|
        guesses[i] = user_input
      end
      puts 'Success!'
    else
      self.turns_remaining -= 1
      puts "You have #{turns_remaining} turns left."
    end
  end

  # Determines what message to show user if game was won/loss
  def inform_win_status
    if guesses.include?('_')
      puts "You lose :( The word was '#{word}'"
    else
      puts 'Congratulations! You win.'
    end
  end
end
