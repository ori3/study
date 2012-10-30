verse = "hoge\nfuga"

count = 0
verse.each_line do |line|
    print line
    count += 1
end
puts
puts count

