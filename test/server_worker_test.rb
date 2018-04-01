require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/server_worker'

class ServerWorkerTest < Minitest::Test
  def setup
    @worker = ServerWorker.new(9292)
    @server = @worker.create
  end

  def teardown
    @server.close
  end

  def test_server_worker_exists
    assert_instance_of ServerWorker, @worker
  end

  def test_server_worker_can_create_tcp_server
    assert_instance_of TCPServer, @server
  end

  def test_tcp_server_uses_port_9292
    assert_equal 9292, @server.addr[1]
  end


end