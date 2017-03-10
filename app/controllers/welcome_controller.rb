class WelcomeController < ApplicationController
  def index
    flash[:alert] = "注意，危险！"
  end
end
