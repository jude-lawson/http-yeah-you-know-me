require 'minitest/autorun'
require 'minitest/pride'
require 'net/http'
require_relative '../lib/server_worker'

# =============== Start server to run tests =============

class ServerWorkerTest < Minitest::Test

  def setup
    @worker = ServerWorker.new(3000)
  end

  def teardown
    @worker.server.close
  end

  def test_worker_and_server_exist
    # server = @worker.server
    assert_instance_of ServerWorker, @worker
    assert_instance_of TCPServer, @worker.server
  end

  def test_server_responds
    res = Net::HTTP.get_response(URI('http://localhost:9292'))
    assert res
  end

  def test_request_to_root_responds_with_a_response_body
    res = Net::HTTP.get_response(URI('http://localhost:9292'))
    assert res.body
  end
end