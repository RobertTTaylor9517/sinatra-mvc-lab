require 'pry'

class PigLatinizer
    attr_reader :text

    def piglatinize(text)
        vowels = ["a", "e", "i", "o", "u"]
        two_letter = ["ch", "sh", "qu", "th", "br", "pl", "pr"]
        three_letter = ["thr", "sch", "squ", "spr"]

        words = text.split(" ")
        p_lat = []

        words.each do |word|
            if vowels.include?(word[0].downcase)
                p_lat.push(word << "way")
            else
                if three_letter.include?(word[0] + word[1] + word[2])
                    first_three = word.slice!(0, 3)

                    p_lat.push(word << first_three << "ay")
                elsif two_letter.include?(word[0] + word[1])
                    first_two = word.slice!(0, 2)
                    p_lat.push(word << first_two << "ay")
                else
                    first_let = word.slice!(0,1)
                    p_lat.push(word << first_let << "ay")
                end
            end


        end
        p_lat.join(" ")
    end|


end

# binding.pry