class MainController < ApplicationController
  before_filter :authenticate

  def create
    notification = Hash.from_xml(params[:notification])['notification']   
    @submitter, @change_notification = notification['submitter'], notification['change_notification']
    render :text => "Successfully submitted details for #{@submitter['first_name']} #{@submitter['family_name']}", :status => :created
  rescue
    render :text => 'Error', :status => 422
  end
end
