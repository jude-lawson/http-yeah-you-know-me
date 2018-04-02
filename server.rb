require_relative './lib/server_worker'
worker = ServerWorker.new(9292)
server = worker.server

worker

# loop do
# connection = server.accept
# puts "Connected"
# worker.successful_request
# output = worker.output
# connection.puts worker.response(:OK, "Content-Length: #{output.length}\r\n")
# connection.puts output
# connection.close
# end