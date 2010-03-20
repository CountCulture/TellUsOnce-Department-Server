require 'test_helper'

class MainControllerTest < ActionController::TestCase
  # create test
   context "on POST to :create" do
     setup do
      @dummy_xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<notification>\n  <change-notification-id type=\"integer\">1</change-notification-id>\n  <change-notification-type>DeathNotification</change-notification-type>\n  <created-at type=\"datetime\">2010-03-20T12:39:20Z</created-at>\n  <department>HMRC</department>\n  <id type=\"integer\">1</id>\n  <processed-at type=\"datetime\">2010-03-20T12:39:26Z</processed-at>\n  <submitter-id type=\"integer\">1</submitter-id>\n  <updated-at type=\"datetime\">2010-03-20T12:39:26Z</updated-at>\n  <change-notification>\n    <created-at type=\"datetime\">2010-03-20T12:39:20Z</created-at>\n    <date-of-birth type=\"date\" nil=\"true\"></date-of-birth>\n    <date-of-death type=\"date\">2010-03-20</date-of-death>\n    <deceased-family-name>Cratchett</deceased-family-name>\n    <deceased-first-name>Bob</deceased-first-name>\n    <deceased-maiden-surname></deceased-maiden-surname>\n    <id type=\"integer\">1</id>\n    <last-address></last-address>\n    <last-postcode></last-postcode>\n    <national-insurance-number></national-insurance-number>\n    <nhs-number></nhs-number>\n    <place-of-birth></place-of-birth>\n    <receiving-other-state-benefit></receiving-other-state-benefit>\n    <receiving-state-pension type=\"boolean\">false</receiving-state-pension>\n    <relationship-to-deceased>friend</relationship-to-deceased>\n    <submitter-id type=\"integer\">1</submitter-id>\n    <tax-reference-number></tax-reference-number>\n    <updated-at type=\"datetime\">2010-03-20T12:39:20Z</updated-at>\n  </change-notification>\n  <submitter>\n    <address>Somewhere St</address>\n    <created-at type=\"datetime\">2010-03-20T12:39:20Z</created-at>\n    <email>fred@foo.com</email>\n    <family-name>Flintstone</family-name>\n    <first-name>Fred</first-name>\n    <id type=\"integer\">1</id>\n    <phone></phone>\n    <postcode>AB1 1BA</postcode>\n    <updated-at type=\"datetime\">2010-03-20T12:39:20Z</updated-at>\n  </submitter>\n</notification>\n"
     end
    
     context "without auth" do
       setup do
         post :create, :notification => @dummy_xml
       end

       should_respond_with 401
     end

     context "with valid params" do
       setup do
         stub_authentication
         post :create, :notification => @dummy_xml
       end
     
       should_respond_with 201 # status code for created
       
       should 'instantiate submitter from xml' do
         assert assigns(:submitter)
       end
       should 'instantiate notification from xml' do
         assert assigns(:change_notification)
       end
     end
     
     context "with invalid params" do
       setup do
         stub_authentication
         post :create, :foo => 'bar'
       end
     
       should_respond_with 422
     end
  
   end  
end
