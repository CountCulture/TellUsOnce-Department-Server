class MainController < ApplicationController
  before_filter :authenticate
  skip_before_filter :verify_authenticity_token
  require 'open-uri'

  def create
    logger.error { "Params received =\n#{params}" }
    notification = Hash.from_xml(params[:notification])['notification']   
    @submitter, @change_notification = notification['submitter'], notification['change_notification']
    begin
      logger.debug { "@submitter location = #{@submitter['postcode']}" }
      reg_offices_json = open("http://tartarus.org/richard/registries/find?maxhits=3&loc=#{URI.escape(@submitter['postcode'])}").read
      reg_offices = ActiveSupport::JSON.decode(reg_offices_json)['registries']
    rescue Exception => e
      logger.error { "Problem getting registry offices: #{e.inspect}" }
    end
    
    SubmitterMailer.deliver_acknowledgment!(@submitter, @change_notification, reg_offices)
    
    render :text => "Successfully submitted details for #{@submitter['first_name']} #{@submitter['family_name']}", :status => :created
  rescue
    render :text => 'Error', :status => 422
  end
end
