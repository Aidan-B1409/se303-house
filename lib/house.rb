
class House

  def initialize(house_type = :default)
    @line_factory = LineFactory.build_factory(house_type)
  end

  def line(num)
    @line_factory.get_line(num)
  end

  def recite
    1.upto(12).collect { |x| line(x) }.join("\n")
  end

end

class LineFactory

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
    house_type == :pirate ? PirateLineFactory.new : LineFactory.new
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