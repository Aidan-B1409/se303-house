require_relative 'verse'

class House

  def initialize(house_type = :house)
    @verse = Verse.get_verse(house_type)
  end

  def line(num)
    @verse.preface << num.downto(1).collect { |x| @verse.get_phrase(x) }.join(' ')
  end

  def recite
    (1..12).collect { |x| line(x) }.join("\n")
  end

  def recite_random
    
  end
end