class House

  def initialize
  end


  def line(num)
    lines = {
      1 => "the house that Jack built.\n",
      2 => 'the malt that lay in ',
      3 => 'the rat that ate ',
      4 => 'the cat that killed ',
      5 => 'the dog that worried ', 
      6 => 'the cow with the crumpled horn that tossed ',
      7 => 'the maiden all forlorn that milked ', 
      8 => 'the man all tattered and torn that kissed '
    }
    str = ''
    num.downto(1).each do |n|
      str << lines[n]
    end
    'This is ' << str
  end
end