require_relative 'decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.split().map(&:capitalize).join(' ')
  end
end
