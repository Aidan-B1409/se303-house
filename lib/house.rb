
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

  def recite_random(seed = Random.new_seed)
    rng = Random.new(seed)
  end

end

class LineFactory
  attr_reader :phrases

  def self.registry
    @registry ||= [LineFactory]
  end

  def self.register(line_factory)
    registry.prepend(line_factory)
  end

  def self.respond_to?(line_factory)
    true
  end

  def self.inherited(line_factory)
    register(line_factory)
  end

  def self.build_factory(house_type)
    registry.find { |verse| verse.respond_to?(house_type) }.new
  end

  def initialize
    @phrases = [
    "the house that Jack built.\n",
    'the malt that lay in',
    'the rat that ate',
    'the cat that killed',
    'the dog that worried',
    'the cow with the crumpled horn that tossed',
    'the maiden all forlorn that milked',
    'the man all tattered and torn that kissed',
    'the priest all shaven and shorn that married',
    'the rooster that crowed in the morn that woke',
    'the farmer sowing his corn that kept',
    'the horse and the hound and the horn that belonged to'
    ]

    @prefix = 'This is'
  end

  def get_line(num)
    @prefix + (num - 1).downto(0).collect { |x| ' ' << @phrases[x]}.join(' ').squeeze(' ')
  end
end

class PirateLineFactory < LineFactory

  def self.respond_to?(line_factory)
    line_factory == :pirate
  end

  def initialize
    super()
    @prefix = 'Thar be'
  end
end