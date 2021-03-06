class Rhyme
  CLAUSES = [
      "the house that Jack built",
      "the malt that lay in",
      "the rat that ate",
      "the cat that killed",
      "the dog that worried",
      "the cow with the crumpled horn that tossed",
      "the maiden all forlorn that milked",
      "the man all tattered and torn that kissed",
      "the priest all shaven and shorn that married",
      "the rooster that crowed in the morn that woke",
      "the farmer sowing his corn that kept",
      "the horse and the hound and the horn that belonged to"
  ]

  attr_reader :ordering

  def initialize(ordering = :in_order) 
    @ordering = ordering
  end

  def clauses
    case ordering
    when :random
      CLAUSES.shuffle
    when :semi_random
      [CLAUSES[0], *CLAUSES[1..].shuffle]
    else
      CLAUSES
    end
  end

  def recite
    clauses.each_index.map do |index|
      body = clauses[0..index].reverse.join(" ")
      "This is #{body}."
    end.join("\n")
  end
end
