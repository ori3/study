puts 1 <=> 2
puts 2 <=> 2
puts 3 <=> 2

array = [6, 7, 2, 3, 7]
p array.sort
array.sort{|x,y|
    return x <=> y
}
p array


