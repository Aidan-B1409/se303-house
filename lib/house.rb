class House

  def line(num)
    phrases = {
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
    'This is ' << num.downto(1).collect { |x| phrases[x] }.join(' ')
  end

  def recite
    (1..12).collect { |x| line(x) }.join("\n")
  end

end

class Verse
  def initialize

  end
  def getline(num)

  end
  
end