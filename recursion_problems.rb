#Problem 1: 

def sum_recur(array)
    return array[0] if array.length <= 1
    first = array[0]
    first += sum_recur(array[1..-1])
end

#Problem 2: 

def includes?(array, target)
    return false if array.empty?
    if array[0] == target
        return true
    else
        array.drop(1)
    end
    includes?(array[1..-1],target)
end

# Problem 3: 

def num_occur(array, target)
    return 0 if array.empty?
    count = 0
    if array.first == target
        count +=1
    end
    count + num_occur(array.drop(1),target)
end

# Problem 4: 

def add_to_twelve?(array)
    return false if array.length < 2
    return true if array[0] + array[1] == 12
    add_to_twelve?(array.drop(1))
end

# Problem 5: 

def sorted?(array)
    return true if array.length < 2
    return false if array[0] > array[1]
    sorted?(array.drop(1))
end

# Problem 6: 

def reverse(string)
    return string if string.length < 2
    first = string[0]
    reverse(string[1..-1]) + first
end