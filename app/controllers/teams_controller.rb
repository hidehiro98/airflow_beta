class TeamsController < ApplicationController
  before_action :set_team, only: [:show]

  def new
    @team = Team.new
    authorize @team
  end

  def create
    @team = Team.new(team_params)
    authorize @team

    if @team.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def show
    authorize @team
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
