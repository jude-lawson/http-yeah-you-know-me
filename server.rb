require_relative './lib/server_worker'
worker = ServerWorker.new(9292)
server = worker.create

loop do
  connection = server.accept
  # output needs to come from htmlparser class using erb
  # instance variables can be passed to the output for request increments
  output = "<html><head></head></body><p>Hello, World! (0)</p></body></html>"
  connection.puts worker.response(:OK, "Content-Length: #{output.length}\r\n")
  connection.puts output
  connection.close
end