class House

  def initialize(house_type = :house)
    @house_type = house_type
  end

  def line(num)
    verse = Verse.get_verse(@house_type)
    verse.preface << num.downto(1).collect { |x| verse.get_phrase(x) }.join(' ')
  end

  def recite
    (1..12).collect { |x| line(x) }.join("\n")
  end
end

class Verse

  def self.registry
    @registry ||= [Verse]
  end

  def self.register(verse)
    registry.prepend(verse)
  end

  def self.inherited(verse)
    register(verse)
  end

  def self.get_verse(house_type)
    case house_type
    when :pirate
      PirateVerse.new
    else
      Verse.new
    end
  end

  def initialize
    @phrases = {
      1 => "the house that Jack built.\n",
      2 => 'the malt that lay in',
      3 => 'the rat that ate',
      4 => 'the cat that killed',
      5 => 'the dog that worried', 
      6 => 'the cow with the crumpled horn that tossed',
      7 => 'the maiden all forlorn that milked', 
      8 => 'the man all tattered and torn that kissed',
      9 => 'the priest all shaven and shorn that married',
      10 => 'the rooster that crowed in the morn that woke',
      11 => 'the farmer sowing his corn that kept',
      12 => 'the horse and the hound and the horn that belonged to'
    }
  end

  def preface
    'This is '
  end

  def get_phrase(num)
    @phrases[num]
  end

end

class PirateVerse < Verse

  def preface
    'Thar be '
  end
end