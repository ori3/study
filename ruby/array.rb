array = ["Bear", "Benford", "Egan"]
#p array.map{|name| "G. #{name}"}
array = array.map{|name| "G. #{name}"}
puts array
p array
p array[0]
p array[100]

array1 = [1, 2, "str"]
array2 = [1, 2, "str"]
puts array1 == array2
puts array1.include? 2
puts array1.include? 3

array3 = [1, 2, 3, 4 , 3, 4,"str"]
p array3.uniq
array3.uniq!
p array3
