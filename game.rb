# -*- encoding : utf-8 -*-
require_relative 'loader.rb'
require_relative 'team.rb'
require_relative 'word_base.rb'
require_relative 'utils.rb'

include Loader
include Utils

class Game  

  def initialize 

    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~IMAGINAÇÃO~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    double_break

    @words = WordBase.new(load_hash)
    @teams = load_teams
    @commands = load_commands
    @current_team = 1
    @categories = @commands.keys
    @pontuations = @words.pontuations
    @map = load_map
    @team_count = @teams.length
    @total_points =  5 #@map.length

    print_teams
  end

  def print_teams
    double_break

    puts "=========SITUAÇÃO=========="

    @teams.each do |team|
      team.print
    end
    double_break
  end

  def quit?
  begin
    # See if a 'Q' has been typed yet
    while c = STDIN.read_nonblock(1)
      puts "INTERRUPCAO"
      return true
    end
    # No 'Q' found
    false
  rescue Errno::EAGAIN
    false
  end
end

  def check_winner round
    if quit?  
      return true
    end
    false
  end

  def wait current_house, start_team

    time = 0

    if current_house == :open or current_house == :choose
      puts "TEMPO TOTAL: 40 SEG POR EQUIPE"
      break_line


      round = start_team
      round_duration = 10

      puts "-Turno EXTRA (SEM FALAR) da equipe: #{start_team}"

      while time < round_duration do
          puts time+=1
          sleep 1

          if check_winner round
            return round
          end
      end

      while round <= 4       

        puts "-Turno número #{round} da equipe: #{start_team}"
        time = 0

        while time < round_duration do
          puts time+=1
          sleep 1
          if check_winner round
            return round
          end
        end

        start_team+=1
        if start_team > @team_count
          start_team = 1
          round+=1
        end

      end

    return 10000

    else 
      puts "TEMPO TOTAL: 1 MIN"
      total = 60

      while time < total do
          puts time+=1
          sleep 1
          if check_winner start_team
            return start_team
          end
      end

      return 10000

    end

    
  end

  def turn
    puts "--------------------------------------------------------------------------"
    puts "--------------------------------NOVO TURNO--------------------------------"
    puts "--------------------------------------------------------------------------"

    print_teams

    possible_choices={
      :open => "ABERTO",
      :choose => "ABERTO/ESCOLHE",
      :closed => "FECHADO",
    }

    team = @current_team


    puts "---TURNO DA EQUIPE #{team}---"
    break_line

    current_category = @categories.sample
    current_pontuation = @pontuations.sample
    current_house = @map[@teams[team-1].points]
    puts "-> Casa de tipo: #{possible_choices[current_house]}"

    #verificar jeito mais justo

    puts "-> Categoria Sorteada: #{current_category}"
    
    puts "-> Pontuação Sorteada: #{current_pontuation}"

    break_line

    puts @words.raffle(current_pontuation, @commands[current_category])

    break_line

    puts "PRESSIONE ENTER PARA INICIAR O ROUND"
    gets

    winner = (wait current_house, team) -1

    unless winner == 9999
      puts "O VENCEDOR DO ROUND É A EQUIPE #{winner}"
      @teams[winner].points = @teams[winner].points + current_pontuation.to_i
    else
      puts "NINGUÉM ACERTOU, VOCÊS SÃO UNS PERDEDORES"
    end

    double_break

    @current_team+=1

    if @current_team > @team_count
      @current_team =1
    end

  end

  def no_winner
    @teams.each do |team|
      if team.points >= @total_points
        return false
      end
    end
    true
  end

  def play
    while no_winner
      turn
    end
    @teams.each do |team|
      if team.points >= @total_points
        puts "VENCEDORES:"
        team.print
      end
    end
  end

end