require 'minitest/autorun'
require 'minitest/pride'
require 'net/http'
require_relative '../lib/server_worker'

# =============== Start server to run tests =============

class ServerWorkerTest < Minitest::Test

  def test_worker_and_server_exist
    worker = ServerWorker.new(3000)
    server = worker.server
    assert_instance_of ServerWorker, worker
    assert_instance_of TCPServer, server
  end

  def test_server_responds
    res = Net::HTTP.get_response(URI('http://localhost:9292'))
    assert res
  end

end