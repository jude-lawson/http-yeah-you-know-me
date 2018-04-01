require_relative './lib/server_worker'
worker = ServerWorker.new(9292)
server = worker.create

connection = server.accept
connection.puts worker.response(:OK, "Content-Length: 0\r\n")
connection.puts "<html><head></head></body><p>Hello, World!</p></body></html>"
# connection.close