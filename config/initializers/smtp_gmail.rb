config_file = "#{RAILS_ROOT}/config/smtp_gmail.yml"
raise "Sorry, you must have #{config_file}" unless File.exists?(config_file)

# require 'tlsmail' if RAILS_ENV=='development'
# 
# config_options = YAML.load_file(config_file) 
# ActionMailer::Base.smtp_settings = {
#   :address => "smtp.gmail.com",
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }.merge(config_options) # Configuration options override default options
config_options = YAML.load_file(config_file) 
# 
# require 'smtp_tls'
# 
# ActionMailer::Base.smtp_settings = {
#   :address => "smtp.gmail.com",
#   :port => "587",
#   :domain => "tellusonce.govtrace.com",
#   :authentication => :plain,
# }.merge(config_options) # Configuration options override default options

require 'tlsmail'
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_charset = "utf-8"

ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
  :domain          => "todemo@gmal.com",
  :address         => 'smtp.gmail.com',
  :port            => 587,
  :tls             => true,
  :authentication  => :plain
}.merge(config_options) # Configuration options override default options