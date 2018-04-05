require_relative './lib/server_worker'
worker = ServerWorker.new(9292)

worker.start_server_loop
