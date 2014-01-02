# -*- encoding : utf-8 -*-

class Team

  attr_accessor :members, :number, :points

  @members =[]

  def initialize (team_members, number)
    @members = team_members
    @number = number
    @points = 0
  end

  def print 
    puts "\n----EQUIPE #{number}: #{@points} pontos----"
    @members.each do |member|
      puts member
    end
  end
end