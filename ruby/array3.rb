array = ["Hoge", "Fuga"]
b = array.map{|a| a.downcase}
p b

c = array.map do |a|
    a.downcase
end
p c
