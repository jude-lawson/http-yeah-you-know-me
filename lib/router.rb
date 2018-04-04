require_relative './response'

class Router
  def initialize
    # @response = Response.new
  end

  def respond(path)
    response = Response.new
    case path
    when '/'
    end
  end
end