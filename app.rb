require_relative 'time_service'

class App

  def call(env)
    @request = Rack::Request.new(env)
    return error_response unless request_valid?

    @time = TimeService.new(@request.params['format'])

    @time.valid? ? valid_response : invalid_response
  end

  private

  def request_valid?
    @request.get? && @request.path == '/time' && @request.params['format']
  end

  def error_response
    responce(404, 'Not found')
  end

  def valid_response
    responce(200, @time.correct_time)
  end

  def invalid_response
    responce(400, @time.invalid_formats)
  end

  def responce(status, body)
    [status, { 'Content-Type' => 'text/plain' }, ["#{body}\n"] ]
  end
end
