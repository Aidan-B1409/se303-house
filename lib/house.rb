require_relative 'verse'

class House

  def initialize(house_type = :house)
    @verse = Verse.get_verse(house_type)
  end

  def line(num)
    @verse.preface << num.downto(1).collect { |x| @verse.get_phrase(x) }.join(' ')
  end

  def recite(linenum = (1..12))
    linenum.collect { |x| line(x) }.join("\n")
  end

  def recite_random(seed: Random.new_seed)
    rng = Random.new(seed)
    recite((1..12).shuffle(rng))
  end
end