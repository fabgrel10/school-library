require_relative 'base_decorator'
require_relative 'capitalize_decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name.strip.length > 10 ? @nameable.correct_name.strip[0..9] : @nameable.correct_name.strip
  end
end
