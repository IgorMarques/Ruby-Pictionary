# -*- encoding : utf-8 -*-

require "unicode_utils/upcase"

class WordBase

  def pontuations
    @words.keys
  end

  def initialize(word_hash)
    @words= word_hash
    @chosen_words = []
  end

  

  def raffle points, category

    word = @words[points][category].sample[0..-2]

    looptime=0
    while @chosen_words.include? word
      word = @words[points][category].sample[0..-2]

      looptime+=1
      #tratar o caso em que todas as palavras foram sorteadas
      if looptime == 5
        puts "Todas as palavras dessa categoria já foram sorteadas!"
      end
    end

    @chosen_words << word
  
    "A palavra sorteada é #{UnicodeUtils.upcase(word)} e vale #{points}"
  end

end