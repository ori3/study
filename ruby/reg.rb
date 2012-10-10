str = '<a href="http://example.com/">example</a>'

if /<a href="(.*?)"[>]/ =~ str
    puts "found:" + $1
end

