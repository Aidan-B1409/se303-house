class House

  def initialize
  end


  def line(num)
    lines = {
      1 => "the house that Jack built.\n",
      2 => 'the malt that lay in ',
      3 => 'the rat that ate '
    }
    str = ''
    num.downto(1).each do |n|
      str << lines[n]
    end
    puts str
    'This is ' << str
  end
end