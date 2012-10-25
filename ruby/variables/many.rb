a, *b = 1,2,3,4,5
p b
p a
puts '-' * 10
array = [1, 2, 3]
a, b, c = *array
p a
p b
p c
puts '-' * 10
array = [1, 2]
a, b, *c, d = *array, 3, 4, 5
p a
p b
p c
p d

