class HomeController < ApplicationController
  def action
    render json: {status:200, message:'Welcome abode'}
  end
end
