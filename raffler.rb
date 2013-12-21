# -*- encoding : utf-8 -*-

module Raffler
  
  @@chosen_words = []

  def raffle points, category

    word = @words[points][category].sample[0..-2]

    while @@chosen_words.include? word
      word = @words[points][category].sample[0..-2]
      #tratar o caso em que todas as palavras foram sorteadas
    end

    @@chosen_words << word
  
    puts "A palavra sorteada é #{word} e vale #{points}"
  end
end