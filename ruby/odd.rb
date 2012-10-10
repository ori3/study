def odd?(n)
    case n % 2
    when 0 then false
    when 1 then true
    else raise "exception"
    end
end

while num = gets
    unless /\d+/ =~ num
        $stderr.puts "numeric input"
        next
    end
    puts num
    num = num.to_i
    puts num
    if odd?(num)
        puts "#{num}は奇数"
    else
        puts "#{num}は偶数"
    end
end

