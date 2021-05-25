
class House

  def initialize()
  end

  def line(num)
    preface = 'This is the'
    suffix = " house that Jack built.\n"
    line = case num
    when 12
      " horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 11
      " farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 10
      " rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 9
      " priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 8
      " man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 7
      " maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 6
      " cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 5
      " dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 4
      " cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 3
      " rat that ate the malt that lay in the house that Jack built.\n"
    when 2
      " malt that lay in the house that Jack built.\n"
    else
      " house that Jack built.\n"
    end
    preface << line[...-24] << suffix
  end

  def recite
    1.upto(12).collect { |x| line(x) }.join("\n")
  end

end