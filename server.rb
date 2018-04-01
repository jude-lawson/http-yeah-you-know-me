require_relative './lib/server_worker'
worker = ServerWorker.new(9292)
server = worker.create

loop do
  connection = server.accept
  output = "<html><head></head></body><p>Hello, World! (0)</p></body></html>"
  connection.puts worker.response(:OK, "Content-Length: #{output.length}\r\n")
  connection.puts output
  connection.close
end