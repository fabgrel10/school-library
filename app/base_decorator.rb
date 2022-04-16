require_relative './nameable'

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    super.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    super.strip.length > 10 ? super.strip[0..9] : super.strip
  end
end
