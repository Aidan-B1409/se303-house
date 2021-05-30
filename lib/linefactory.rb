
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

  def self.build_factory(house_type, seed)
    registry.find { |verse| verse.respond_to?(house_type) }.new(seed)
  end

  def get_seed(seed)
    nil
  end

  def initialize(seed)
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

    @line_gen = Line.build_line(seed)
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

  def initialize(seed)
    super(seed)
    @prefix = 'Thar be'
  end
end

class Line

  def self.registry
    @registry ||= [Line]
  end

  def self.register(line_type)
    registry.prepend(line_type)
  end

  def self.respond_to?(line_type)
    true
  end

  def self.inherited(line_type)
    register(line_type)
  end

  def self.build_line(line_type)
    registry.find { |verse| verse.respond_to?(line_type) }.new
  end

  def get_range(num)
    (num-1..0).to_a
  end
end

class RandomLine < Line

  def self.respond_to?(line_type)
    line_type == :random
  end
end
