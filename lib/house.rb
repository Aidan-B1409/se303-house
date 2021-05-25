
class House

  def initialize()
  end

  def line(num)
    case num
    when 4
      "This is the cat that killed the rat that ate the malt that lay in the house that Jack built.\n"
    when 3
      "This is the rat that ate the malt that lay in the house that Jack built.\n"
    when 2
      "This is the malt that lay in the house that Jack built.\n"
    else
      "This is the house that Jack built.\n"
    end
  end

  def recite()
  end

end