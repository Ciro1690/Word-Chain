require 'set'

class WordChain

    def initialize
        @start_word = ""
        @end_word = ""
        @words = File.readlines("dictionary.txt").map(&:chomp)
        @dictionary = Set.new(@words)
        @possible_words = []
    end

    def get_words
        print "Please enter your starting word: "
        @start_word = gets.chomp
        while !valid_word?(@start_word)
            print "Please enter your starting word: "
            @start_word = gets.chomp
        end
        puts @start_word + " is your starting word."

        print "Please enter an ending word of the same length: "
        @end_word = gets.chomp
        while !valid_word?(@end_word)
            print "Please enter your ending word: "
            @end_word = gets.chomp
        end
        puts @end_word + " is your ending word."
        limit_dictionary(@start_word)
        @possible_words << @start_word
        change_letter(@start_word,@end_word)
    end

    def valid_word?(word)
        if @dictionary.include?(word)
            return true
        else
            return false
        end
    end

    def limit_dictionary(word)
        length = word.length
        @dictionary.select! {|word| word.length == length}
    end

    def change_letter(start,ending)
        working_word = start.dup

        while working_word != ending
            working_word.each_char.with_index do |char,ind|
                if working_word[ind] == ending[ind]
                    next
                else
                    working_word[ind] = ending[ind]
                    if valid_word?(working_word)
                        @possible_words << working_word
                    else
                        working_word[ind] = start[ind]
                    end
                end
            end
        end
        p @possible_words
    end
end

w = WordChain.new
w.get_words