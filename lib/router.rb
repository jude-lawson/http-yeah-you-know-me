class Router
  def initialize
    # @response = Response.new
  end

  def respond(path)
    # Local variable response_string
    case path
    when '/'
      """
    <html>
      <head>
      </head>
      <body>
        <p>Hello, World! #{@request_count}</p>
      </body>
    </html>
    """
    end
    # Concatenate diagnostics
    # Return response_string
  end
end