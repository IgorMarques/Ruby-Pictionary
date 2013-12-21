# -*- encoding : utf-8 -*-

class Team

  attr_reader :members

  @members =[]
  def initialize (team_members)
    @members = team_members
  end
end