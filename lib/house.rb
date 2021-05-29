require_relative 'linefactory'

class House

  def initialize(house_type = :default)
    @line_factory = LineFactory.build_factory(house_type)
    @line_indices = *(1..@line_factory.phrases.length)
  end

  def line(num)
    @line_factory.get_line(num)
  end

  def recite
    _recite(@line_indices)
  end

  def _recite(range)
    range.collect { |x| line(x) }.join("\n")
  end

  def recite_random_line_order(seed = Random.new_seed)
    rng = Random.new(seed)
    _recite(@line_indices.shuffle!(random: rng))
  end

end
