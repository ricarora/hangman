require "colorize"


word_bag = %w{ abbey abruptly affix askew axiom azure
  abyss akimbo avenue awkward axolotl axis bagpipes
  bandwagon banjo bayou bikini blitz bookworm
    boxcar boxful buckaroo buffalo buffoon buxom
    cobweb croquet caliph crypt cycle curacao
    daiquiri disavow duplex dwarves dirndl equip exodus
    euouae fishhook fixable foxglove fjord flyby fuchsia
    galaxy galvanize gazebo gizmo glowworm guffaw
      giaour glyph gnarly gnostic gypsum haiku haphazard
      hyphen icebox injury ivory ivy iatrogenic jaundice
      jawbreakerjaywalk jazzy jigsaw jiujitsu jockey jovial
      joyful juicy jumbo jinx jukebox kazoo keyhole
      khaki kilobyte kiosk kiwifruit knapsack kayak kitsch
      klut larynx luxury lymph marquis megahertz microwave
      mystify mnemonic nightclub nowadays numbskull naphtha
      ovary oxidize oxygen onyx pajama peekaboo pixel
      pizazz pneumonia polka phlegm pshaw psyche quartz
      quiz quorum queue quixotic razzmatazz rhubarb
      rickshaw rhythm schizophrenia sphinx spritz squawk
      subway swivel stymied syrinx syzygy topaz twelfths
      unknown unworthy unzip uptown vaporize vixen vodka
      vortex voyeurism walkway waltz wavy waxy wheezy
      whiskey whomever wimpy wizard woozy wave wyvern
      xylophone xystus yachtsman yippee youthful yummy
      zephyr zigzag zilch zodiac zombie zugzwang zyme
      zymurgy}

MAX_BAD_GUESSES = 6

class Board
# This class is responsible for drawing the state of the game
# as ASCII
# This class colloborates with Board GameModel which has the state of the game
# and with class GameController which calls it to draw
# attr_accessor :num_bad_guesses
#
# def initialize(num_bad_guesses)
#   # @num_bad_guess = model.num_bad_guesses
#   @num_bad_guesses = num_bad_guesses


# end

# def num_bad_guess
#   @model.num_bad_guesses
# end

def print_board(num_bad_guess)
  puts "num_bad_guess: #{num_bad_guess}"

  @head = "(_)".colorize(:red) #
  @left_arm = "\\".colorize(:blue)
  @right_arm = "/".colorize(:blue)
  @left_leg = "/".colorize(:green)
  @right_leg = "\\".colorize(:green)
  @torso = "|".colorize(:yellow)
  @hangman_body_parts = [@head, @torso, @left_arm, @right_arm, @left_leg, @right_leg]

  blank_parts = (num_bad_guess..@hangman_body_parts.length).map {|i| " "}
  #puts "blank_parts: #{blank_parts}"
  filled_parts = (0...num_bad_guess).map {|i| @hangman_body_parts[i]}
  #puts "filled_parts: #{filled_parts}"

  @hangman_body_parts = filled_parts + blank_parts
  @head, @torso, @left_arm, @right_arm, @left_leg, @right_leg = @hangman_body_parts

  hangman_arr = ["|    _________  ",
                 "|    |/      |  ",
                 "|    |      #{@head} ",
                 "|    |      #{@left_arm}#{@torso}#{@right_arm}",
                 "|    |       #{@torso}  ",
                 "|    |      #{@left_leg} #{@right_leg}",
                 "|    |          ",
                 "| ___|___       "]
  hangman_arr.each {|arr| puts arr}
end



end


class GameModel
  # This class has game state - what is the hidden word
  # what characters have been guessed
  # and from this you can calculate whether the game is won
  # or lost
  # colloborators - GameController class
  attr_accessor :secret, :characters

  def initialize(word_bag)
    @secret = word_bag.sample
    @characters= empty_characters
    @guesses = []
    @bad_char = []
    @board = Board.new
  end

  def make_guess(guessed_letter)
    return false if @guesses.include?(guessed_letter)
    @secret.chars.each_with_index do |letter, index|
      if guessed_letter == letter
        @characters[index] = letter
      end
    end
    @guesses << guessed_letter
  end

  def guess
    @characters.join(" ")
  end

  def empty_characters
    Array.new(@secret.length, "_")
  end

  def num_bad_guesses
    @guesses.select {|c| !@secret.include?(c) }.length

  end

  def game_lost
    num_bad_guesses == MAX_BAD_GUESSES
  end

  def game_won
    unguessed = @secret.chars.reject {|c| @guesses.include?(c) }
    unguessed.length == 0
  end

  def draw
    @board.print_board(num_bad_guesses)
  end

end



def run(word_bag)
  g = GameModel.new(word_bag)
  # h = Board.new(g)
  #h.print_board
  until g.game_lost || g.game_won


  #puts g.empty_characters
    puts g.secret
    puts g.guess
    puts "What letter would you like to guess?\n"
    guess = gets.chomp
    #puts g.make_guess(guess)
    g.make_guess(guess)
    g.draw
    #puts g.characters.include?("a")
    puts g.num_bad_guesses
  end

end

run(word_bag)
