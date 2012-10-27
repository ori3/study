
array_list = [4, 5]
value = 12;
case value
when 1 then
 puts "1_value"
when 2 then
 puts "2_value"
when 3 then
when *array_list
 puts value.to_s + "_value"
else
 puts value.to_s + "_else"
end


value = 1;
result = case value
when 1 then
 "1_value"
when 2 then
 "2_value"
when 3 then
when *array_list
 value.to_s + "_value"
else
 value.to_s + "_else"
end

puts result

