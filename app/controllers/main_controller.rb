class MainController < ApplicationController
  before_filter :authenticate
  protect_from_forgery false

  def create
    logger.error { "Params received =\n#{params}" }
    notification = Hash.from_xml(params[:notification])['notification']   
    @submitter, @change_notification = notification['submitter'], notification['change_notification']
    render :text => "Successfully submitted details for #{@submitter['first_name']} #{@submitter['family_name']}", :status => :created
  rescue
    render :text => 'Error', :status => 422
  end
end
