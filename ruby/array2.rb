array1 = ["1", "2", "str"]

array1.each do |item|
    print item + " "
end
puts
puts "-" * 10
array1.each_with_index do |item, index|
    puts item + " | " + index.to_s
end
