require 'set'~

class WordChain
    ALPHABET = Set.new("a".."z")

    attr_accessor :start_word, :end_word

    def initialize
        @start_word = start_word
        @end_word = end_word
        @dictionary = Set.new(@words)
        @words = File.readlines("dictionary.txt").map(&:chomp)
    end

    def get_words
        print "Please enter your starting word: "
        start_word = gets.chomp
        while !valid_word?(start_word)
            print "Please enter your starting word: "
            start_word = gets.chomp
        end
        puts start_word + " is your starting word."

        print "Please enter your ending word: "
        end_word = gets.chomp
        while !valid_word?(end_word)
            print "Please enter your ending word: "
            end_word = gets.chomp
        end
        puts end_word + " is your ending word."

        print adjacent_words(start_word)
    end

    def valid_word?(word)
        if @words.include?(word)
            return true
        else
            puts "This is not a valid word."
            return false
        end
    end

    def adjacent_words(word)
        possible_words = []
        working_word = word
        alpha_array = ALPHABET.to_a

        word.each_char do |char|
            alpha_array.each do |letter|
                working_word[char] = letter
                if valid_word?(working_word)
                   possible_words << working_word
                end
            end
        end
        possible_words
    end
end

w = WordChain.new
w.get_words
