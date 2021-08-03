class TimeService

  FORMATS = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }.freeze

  def initialize(formats)
    format_params(formats)
  end

  def correct_time
    formats = @valid_formats.map { |time| FORMATS[time] }.join('-')
    Time.now.strftime(formats)
  end

  def valid?
    @invalid_format.empty?
  end

  def invalid_formats
    "Unknown time format #{@invalid_format}"
  end

  private

  def format_params(params)
    params = params.split(',')
    @valid_formats, @invalid_format = params.partition { |param| FORMATS.key?(param) }
  end
end
