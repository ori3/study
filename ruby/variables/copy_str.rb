def describe(name)
    name = name.dup #複製
    puts "This is a #{name}."
    name[2] = ?p
    puts "this is a #{name}."
end

CATTLE = "Yahoo"
describe(CATTLE)
p CATTLE


