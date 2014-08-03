class SplashController < ApplicationController
  def index
    @invite = BetaInvite.new
  end
end
