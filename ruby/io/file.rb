File.open("sample.txt") { |f|
    contents = f.read
    puts contents
}
