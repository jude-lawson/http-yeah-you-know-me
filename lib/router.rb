require_relative './response'

class Router
  def initialize(client)
    @response = Response.new
    @client = client
  end

  def respond(path)
    response = Response.new
    case path
    when '/'
      # Response object send headers
      @client.puts response.headers
      # Response object send appropriate response body
      @client.puts response.body('index')
    end
  end
end