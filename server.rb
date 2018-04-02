require_relative './lib/server_worker'
worker = ServerWorker.new(9292)

# loop do
#   client = worker.create_client
#   worker.receive_request(client)
#   puts "Received request: "
#   p worker.request
#   worker.close(client)
# end

worker.start_server_loop
