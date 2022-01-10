class Bottles

    def verse(current_bottle)
        if current_bottle == 0
            return "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
        elsif current_bottle == 1
            return "#{current_bottle} bottle of beer on the wall, #{current_bottle} bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
        else
            last_verse = "#{current_bottle-1} bottles of beer on the wall."
            if current_bottle == 2
                last_verse = "#{current_bottle-1} bottle of beer on the wall."
            end
            return "#{current_bottle} bottles of beer on the wall, #{current_bottle} bottles of beer.\nTake one down and pass it around, #{last_verse}\n"
        end
    end

    def verses(current_bottle, next_bottle)
        for bottle in current_bottle.downto(next_bottle)
            verse(bottle)
        end
    end

end