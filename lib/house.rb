require_relative 'linefactory'

class House

  def initialize(house_type: :default, phrase_type: :sequential, seed: nil)
    @line_factory = LineFactory.build_factory(house_type, phrase_type, seed)
    @line_indices = *(1..@line_factory.phrases.length)
  end

  def line(num)
    @line_factory.get_line(num)
  end

  def recite
    @line_indices.collect { |x| line(x) }.join("\n")
  end

end
