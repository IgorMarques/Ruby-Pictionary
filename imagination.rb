# -*- encoding : utf-8 -*-

def load_array file

  vector =[]

  File.readlines("words/#{file}.txt").each do |line|
    vector << line
  end

  return vector
end

#=====================ANIMAL======================
animal_1 = load_array "animal_1"
animal_3 = load_array "animal_3"
animal_6 = load_array "animal_6"

#=====================PERSON======================
person_1 = load_array "person_1"
person_3 = load_array "person_3"
person_6 = load_array "person_6"

#======================HARD=======================
hard_1 = load_array "hard_1"
hard_3 = load_array "hard_3"
hard_6 = load_array "hard_6"

#======================OBJECT=====================
object_1 = load_array "object_1"
object_3 = load_array "object_3"
object_6 = load_array "object_6"

#======================PLACE======================
place_1 = load_array "place_1"
place_3 = load_array "place_3"
place_6 = load_array "place_6"

#==================ACTIVITY/SPORT=================
activity_1 = load_array "activity_1"
activity_3 = load_array "activity_3"
activity_6 = load_array "activity_6"

#======LEISURE(MOVIE/BOOK/SERIES/BAND/SONG)=======
leisure_1 = load_array "leisure_1"
leisure_3 = load_array "leisure_3"
leisure_6 = load_array "leisure_6"


one   = {:animal => animal_1, :person => person_1, :hard => hard_1, :object => object_1, :place => place_1, :activity => activity_1, :leisure => leisure_1}
three = {:animal => animal_3, :person => person_3, :hard => hard_3, :object => object_3, :place => place_3, :activity => activity_3, :leisure => leisure_3}
six   = {:animal => animal_6, :person => person_6, :hard => hard_6, :object => object_6, :place => place_6, :activity => activity_6, :leisure => leisure_6}

@points = {
  "1" => one, 
  "3" => three, 
  "6" => six,
}


def raffle points, category
  word = @points[points][category].sample[0..-2]
  #lembrar de fazer eliminador de palavras
  puts "A palavra sorteada é #{word} e vale #{points}"
end

raffle "1", :animal