require_relative './lib/server_worker'
worker = ServerWorker.new(9292)
server = worker.server

loop do
  client = worker.create_client
  worker.receive_request(client)

  puts "Received request: "
  p worker.request
  client.close
end
