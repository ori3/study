require 'stringio'

buffer = String.new
sio = StringIO.new(buffer)
$stderr = $stdout = sio
puts "untuh"      # 標準出力(bufferへ)
warn "outed"      # 標準エラー出力(bufferへ)
$stdout = STDOUT
puts buffer



