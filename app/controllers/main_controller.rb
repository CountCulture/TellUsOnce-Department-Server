class MainController < ApplicationController
  before_filter :authenticate
  skip_before_filter :verify_authenticity_token

  def create
    logger.error { "Params received =\n#{params}" }
    notification = Hash.from_xml(params[:notification])['notification']   
    @submitter, @change_notification = notification['submitter'], notification['change_notification']
    SubmitterMailer.deliver_acknowledgment!(@submitter, @change_notification)
    render :text => "Successfully submitted details for #{@submitter['first_name']} #{@submitter['family_name']}", :status => :created
  rescue
    render :text => 'Error', :status => 422
  end
end
