require './lib/html_reader'

class Router
  def initialize
    @reader = HTMLReader.new
  end

  def respond(path, request_count = 0)
    # Local variable response_string
    case path
    when '/'
      @reader.read('index') % { request_count: request_count }     
    end
    # Concatenate diagnostics
    # Return response_string
  end
end