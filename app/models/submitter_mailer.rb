class SubmitterMailer < ActionMailer::Base
  def acknowledgment(submitter_hash, notification_hash)
    @recipients   = submitter_hash['email']
    @from         = 'notifier@dwp_test_foo.co.uk'
    @subject      = "Acknowledgment of notification of death"
    @sent_on      = Time.now
    @body[:notification] = notification_hash
    @body[:submitter] = submitter_hash
    @headers      = {}
    
  end

end
