
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
    @subjects = [
      'the malt',
      'the rat',
      'the cat',
      'the dog',
      'the cow with the crumpled horn',
      'the maiden all forlorn',
      'the man all tattered and torn',
      'the priest all shaven and shorn',
      'the rooster that crowed in the morn',
      'the farmer sowing his corn',
      'the horse and the hound and the horn'
    ]
    @verbs = [
      'lay in',
      'ate',
      'killed',
      'worried',
      'tossed',
      'milked',
      'kissed',
      'married',
      'woke',
      'kept',
      'belonged to'
    ]
    @prefix = "the house that Jack built.\n"
  end

  def assemble_phrases
    phrases = @subjects.zip(@verbs)
    phrases = phrases.collect{ |x| x.join(" that ") }
  end

  def get_phrases
    phrases = assemble_phrases()
    phrases.prepend(@prefix)
  end
end

class RandomPhrases < Phrases

  def self.respond_to?(phrase_type)
    phrase_type == :random
  end

  def initialize(seed)
    super(seed)
  end

  def get_phrases
    phrases = assemble_phrases()
    phrases = phrases.shuffle(random: @rng)
    phrases.prepend(@prefix)
  end
end

class RandomSubjectVerb < Phrases

  def self.respond_to?(phrase_type)
    phrase_type == :random_subject_verb
  end

  def initialize(seed)
    super(seed)
    @subjects = @subjects.shuffle(random: @rng)
    @verbs = @verbs.shuffle(random: @rng)
  end
end
