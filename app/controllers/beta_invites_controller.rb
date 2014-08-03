class BetaInvitesController < ApplicationController
  def index
  end

  def create
    if BetaInvite.create(beta_invite_params).valid?
      flash[:success] = "Thanks for signing up! We'll get your invite to you ASAP!"
    else
      flash[:error] = "Please enter a valid email address!"
    end

    redirect_to root_path
  end

  private
    def beta_invite_params
      params.require(:beta_invite).permit(:email)
    end
end
