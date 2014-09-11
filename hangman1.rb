require "colorize"

word_bag = ["abbey", "abruptly", "affix", "askew", "axiom", "azure",
  "abyss", "akimbo", "avenue", "awkward", "axolotl", "axis", "bagpipes",
  "bandwagon", "banjo", "bayou", "bikini", "blitz", "bookworm",
    "boxcar", "boxful", "buckaroo", "buffalo", "buffoon", "buxom",
    "cobweb", "croquet", "caliph", "crypt", "cycle", "curacao",
    "daiquiri", "disavow", "duplex", "dwarves", "dirndl", "equip", "exodus",
    "euouae", "fishhook", "fixable", "foxglove", "fjord", "flyby", "fuchsia",
    "galaxy", "galvanize", "gazebo", "gizmo", "glowworm", "guffaw",
      "giaour", "glyph", "gnarly", "gnostic", "gypsum", "haiku", "haphazard",
      "hyphen", "icebox", "injury", "ivory", "ivy", "iatrogenic", "jaundice",
      "jawbreaker","jaywalk", "jazzy", "jigsaw", "jiujitsu", "jockey", "jovial",
      "joyful", "juicy", "jumbo", "jinx", "jukebox", "kazoo", "keyhole",
      "khaki", "kilobyte", "kiosk", "kiwifruit", "knapsack", "kayak", "kitsch",
      "klut", "larynx", "luxury", "lymph", "marquis", "megahertz", "microwave",
      "mystify", "mnemonic", "nightclub", "nowadays", "numbskull", "naphtha",
      "ovary", "oxidize", "oxygen", "onyx", "pajama", "peekaboo", "pixel",
      "pizazz", "pneumonia", "polka", "phlegm", "pshaw", "psyche", "quartz",
      "quiz", "quorum", "queue", "quixotic", "razzmatazz", "rhubarb",
      "rickshaw", "rhythm", "schizophrenia", "sphinx", "spritz", "squawk",
      "subway", "swivel", "stymied", "syrinx", "syzygy", "topaz", "twelfths",
      "unknown", "unworthy", "unzip", "uptown", "vaporize", "vixen", "vodka",
      "vortex", "voyeurism", "walkway", "waltz", "wavy", "waxy", "wheezy",
      "whiskey", "whomever", "wimpy", "wizard", "woozy", "wave", "wyvern",
      "xylophone", "xystus", "yachtsman", "yippee", "youthful", "yummy",
      "zephyr", "zigzag", "zilch", "zodiac", "zombie", "zugzwang", "zyme",
      "zymurgy"]

class Board
# This class is responsible for drawing the state of the game
# as ASCII
# This class colloborates with Board GameModel which has the state of the game
# and with class GameController which calls it to draw

def initialize
  @head = "   " #(_)
  @left_arm = "  "#\\
  @right_arm = " "#/
  @left_leg = " "#/
  @right_leg = "  "#
  @torso_upper = " "#|
  @torso_lower = " "#|

end

def print_board
  hangman_arr = ["|    _________  ",
                 "|    |/      |  ",
                 "|    |      #{@head} ",
                 "|    |      #{@left_arm}#{@torso_upper}#{@right_arm}",
                 "|    |       #{@torso_lower}  ",
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
# colloborators - Board class, GameController class
attr_accessor :secret, :characters

def initialize(word_bag)
  @secret = word_bag.sample
  @characters= empty_characters
end

def make_guess(guessed_letter)
  @secret.chars.each_with_index do |letter, index|
    if guessed_letter == letter
      @characters[index] = letter
    end
  end
end

def guess
  
end

def empty_characters
  Array.new(@secret.length, "_")
end

def characters
  @characters
end

def random_word(word_bag)
  @secret
end

end


class GameController
# this class is responsible for prompting the user to guess
# or letting them know when they have lost
# and changing the state of the GameModel object
# and asking the Board object to redraw

end

h = Board.new
h.print_board

g = GameModel.new(word_bag)
puts g.empty_characters
