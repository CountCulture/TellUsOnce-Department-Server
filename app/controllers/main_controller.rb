class MainController < ApplicationController
  before_filter :authenticate

  def create
    if notification = params[:notification]
      render :text => 'foo', :status => :created
    else
      render :text => 'Error', :status => 422
    end
  end
end
