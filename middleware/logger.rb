require 'logger'

class AppLogger

  def initialize(app, **option)
    @logger = Logger.new(option[:logdev] || STDOUT)
    @app = app
  end

  def call(env)
    @logger.info(env)
    @app.call(env)
  end
  
end
