require_relative 'phrases'

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

  def self.build_factory(house_type, phrase_type, seed)
    registry.find { |verse| verse.respond_to?(house_type) }.new(phrase_type, seed)
  end

  def get_seed(seed)
    nil
  end

  def initialize(phrase_type, seed)
    @phrases = Phrases.get_phrase_type(phrase_type, seed).get_phrases
    @prefix = 'This is'
  end

  def get_line(num)
    @prefix + (num-1).downto(0).collect { |x| ' ' << @phrases[x]}.join(' ').squeeze(' ') 
  end
end

class PirateLineFactory < LineFactory

  def self.respond_to?(line_factory)
    line_factory == :pirate
  end

  def initialize(phrase_type, seed)
    super(phrase_type, seed)
    @prefix = 'Thar be'
  end
end
