
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

class Phrases

  def self.registry
    @registry ||= [Phrases]
  end

  def self.register(phrase_type)
    registry.prepend(phrase_type)
  end

  def self.respond_to?(phrase_type)
    true
  end

  def self.inherited(phrase_type)
    register(phrase_type)
  end

  def self.get_phrase_type(phrase_type, seed)
    registry.find { |phrase| phrase.respond_to?(phrase_type) }.new(seed)
  end

  def initialize(seed)
    @rng = seed.nil? ? Random.new : Random.new(seed)
    @phrases = [
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
      @prefix = "the house that Jack built.\n"
  end

  def get_phrases
    @phrases.prepend(@prefix)
    @phrases
  end
end

class RandomPhrases < Phrases

  def self.respond_to?(phrase_type)
    phrase_type == :random
  end

  def initialize(seed)
    super(seed)
    @phrases = @phrases.shuffle(random: @rng)
  end
end
