require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/server_worker'

# Start server to run tests

class ServerWorkerTest < Minitest::Test

  def test_worker_exists
    worker = ServerWorker.new(9292)
    assert_instance_of ServerWorker, worker
  end

  def test_server_exists
    skip
    worker = ServerWorker.new(9292)
  end

end