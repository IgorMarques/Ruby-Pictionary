# -*- encoding : utf-8 -*-

require_relative 'loader.rb'
require_relative 'raffler.rb'
require_relative 'team.rb'

include Loader
include Raffler

def game

  @points = load_hash
  @teams = load_teams

  raffle "1", :animal

  commands = {
    "an" => :animal,
    "di" => :hard,
    "lu" => :place,
    "ac" => :activity,
    "la" => :leisure,
    "pe" => :person,
  }

  # a = gets
  # b = gets


  # puts commands[b]

  # raffle "1", :animal

  @teams.each do |team|
    puts team.members[1]
  end

end

game