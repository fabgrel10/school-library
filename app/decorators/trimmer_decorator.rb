require_relative 'base_decorator'
require_relative 'capitalize_decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.strip.length > 10 ? @nameable.strip[0..9] : @nameable.strip
  end
end
