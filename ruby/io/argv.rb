expression = ARGV.join(' + ')
puts expression
total = ARGV.inject(0) { |subtotal, arg| subtotal + arg.to_i }

puts "#{expression} = #{total}"
#puts "#{expression} = "

