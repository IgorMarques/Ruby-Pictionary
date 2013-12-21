# -*- encoding : utf-8 -*-
require_relative 'loader.rb'
require_relative 'team.rb'
require_relative 'word_base.rb'
require_relative 'utils.rb'

include Loader
include Utils

class Game  

  def initialize 

    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~IMAGINAÇÃO~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    double_break

    @words = WordBase.new(load_hash)
    @teams = load_teams
    @commands = load_commands
    @current_team = 0
    @categories = @commands.keys
    @pontuations = @words.pontuations

    print_teams
  end

  def print_teams
    double_break
    puts "=========EQUIPES=========="

    @teams.each do |team|
      team.print
    end
    double_break
  end

  def turn
    puts "--------------------------------------------------------------------------"
    puts "--------------------------------NOVO TURNO--------------------------------"
    puts "--------------------------------------------------------------------------"

    print_teams

    puts "-TURNO DA EQUIPE #{@current_team+1}"
    double_break

    current_category = @categories.sample
    current_pontuation = @pontuations.sample
    #verificar jeito mais justo

    puts "-Categoria Sorteada:"
    puts current_category
    break_line
    puts "-Pontuação Sorteada:"
    puts current_pontuation
    break_line

    puts @words.raffle(current_pontuation, @commands[current_category])

    #@teams[@current_team].print
  end


end