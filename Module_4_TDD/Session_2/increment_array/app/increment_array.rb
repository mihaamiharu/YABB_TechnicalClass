class IntegerArrayIncrement
    def increment(integer_array)

        arr_first = integer_array[0] + 1
        incremented = integer_array[-1] + 1

        if integer_array.size == 1
            if incremented == 10
                diff = 10 - incremented
                p [1, diff]
            else 
                p [incremented]
            end
        elsif integer_array[-1] == 9
            p [arr_first, 0]
        else
            result = integer_array
            result[-1] = incremented
            p result
        end

    end
end