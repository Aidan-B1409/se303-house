
class House

  def initialize()
  end

  def line(num)
    case num
    when 3
      "This is the rat that ate the malt that lay in the house that Jack built.\n"
    else
      if(num == 2)
        "This is the malt that lay in the house that Jack built.\n"
      else
        "This is the house that Jack built.\n"
      end
    end
  end

  def recite()
  end

end