require 'pathname'
#path = Pathname.new("/usr/bin/ruby")
path = Pathname.new("./file.txt")
File.open(path) { |f|
    puts f
}
