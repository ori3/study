catch (:exit) {
    loop do
        loop do
            puts "loop"
            throw :exit
        end
    end
}




