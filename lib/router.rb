require './lib/html_reader'

class Router
  def initialize
    @reader = HTMLReader.new
  end

  def respond(path, request, request_count = 0)
    diagnostics = "<pre>Method: #{request.method}\r\n\nPath: #{request.path}\r\n\nProtocol: #{request.protocol}\r\n\n#{request.headers.join("\n")}</pre>"
    case path
    when '/'
      @reader.read('index') % { request_count: request_count, diagnostics: diagnostics }     
    end
  end
end