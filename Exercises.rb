def sum_to(n)
    return n if n == 1
    return nil if n < 1
    n + sum_to(n-1)
end

def add_numbers(array)
    sum = 0
    return array[0] if array.length < 2
    sum += array[0] + add_numbers(array[1..-1])
end

def gamma_fnc(num)
    return nil if num == 0
    return 1 if num == 1
    (num-1) * gamma_fnc(num-1)
end

def ice_cream_shop(flavors,fav)
    return false if flavors.empty?
    return true if flavors.first == fav
    ice_cream_shop(flavors[1..-1],fav)
end

def reverse(str)
    return str if str.length <= 1
    str[-1] + reverse(str[0..-2])
end

def range(min,max)
    return [] if max < min
    array = []
    while min < max
        array << min
    min +=1
    end
    array
end

def range2(min,max)
    return [] if max <= min
    range2(min,max-1) << max-1
end

def exp(base,power)
    return 1 if power == 0
    return base if power == 1
    base * exp(base,power-1)
end

def exp2(base,power)
    return 1 if power == 0
    return base if power == 1
    if power % 2 == 0
        exp2(base,power/2) ** 2
    else
        base * (exp2(base,(power-1)/2) ** 2)
    end
end

class Array
    def deep_dup
        new_array = []
        self.each do |ele|
            new_array <<  (ele.is_a?(Array) ? ele.deep_dup : ele)
        end
        new_array
    end
    def subsets
        return [[]] if empty?
        subs = take(count - 1).subsets
        subs.concat(subs.map { |sub| sub + [last] })
    end

end

def fibonacci(n)
    if n <=2
        [0,1].take(n)
    else
        fibs = fibonacci(n-1)
        fibs << fibs[-2] + fibs[-1]
    end
end


def bsearch(nums, target)
  # nil if not found; can't find anything in an empty array
  return nil if nums.empty?

  probe_index = nums.length / 2
  case target <=> nums[probe_index]
  when -1
    # search in left
    bsearch(nums.take(probe_index), target)
  when 0
    probe_index # found it!
  when 1
    # search in the right; don't forget that the right subarray starts
    # at `probe_index + 1`, so we need to offset by that amount.
    sub_answer = bsearch(nums.drop(probe_index + 1), target)
    sub_answer.nil? ? nil : (probe_index + 1) + sub_answer
  end
end

def merge_sort(list)
    if list.length <= 1
        list
    else
        mid = (list.length/2).floor
        left = merge_sort(list[0..mid - 1])
        right = merge_sort(list[mid..list.length])
        merge(left,right)
    end
end

def merge(left,right)
    if left.empty?
        right
    elsif right.empty?
        left
    elsif left.first < right.first
        [left.first] + merge(left[1..left.length],right)
    else
        [right.first] + merge(left,right[1..right.length])
    end
end

def permutations(array)
    return [array] if array.length <=1
    first = array.shift
    perms = permutations(array)
    total_perms = []

    perms.each do |perm|
        (0..perm.length).each do |i|
            total_perms << perm[0...i] + [first] + perm[i..-1]
        end
    end
    total_perms
end

def make_change(amount,coins)
    change = []
    first_coin = coins[0]
    count = amount / first_coin
    count.times {change << first_coin}
    amount = amount - count * first_coin

    if amount > 0
        change = change + make_change(amount, coins.drop(1))
    end
    change
end

def make_change2(amount,coins)
    return [] if amount == 0
    best_change = nil

    coins.each do |coin|
        next if coin > amount

        change_for_rest = make_change2(amount - coin, coins)
        change = [coin] + change_for_rest

        if best_change.nil? || change.count < best_change.count
            best_change = change
        end
    end
    best_change
end

p make_change2(14, [10,7,1])