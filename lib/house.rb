
class House

  def initialize()

  end

  def line(num)
    preface = 'This is'
    suffix = "the house that Jack built.\n"

    phrases = [
      nil,
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
    line = (num-1).downto(0).collect { |x| phrases[x] }.join(' ')
    "#{preface} #{line} #{suffix}".squeeze(' ')
  end

  def recite
    1.upto(12).collect { |x| line(x) }.join("\n")
  end

end