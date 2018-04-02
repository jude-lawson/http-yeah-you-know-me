require_relative './lib/server_worker'
worker = ServerWorker.new(9292)
server = worker.server

loop do
  client = server.accept
  request = []
  line = client.gets
  until line == "\r\n"
    request << line
    line = client.gets
  end

  puts "Received request: "
  p request
  client.close
end
