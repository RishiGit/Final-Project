require 'nokogiri'
require 'open-uri'
require 'mechanize'
require_relative 'Lib/scraper_project.rb'
require_relative 'Lib/twilio2.rb'
require_relative 'Lib/mailgun.rb'
require 'twilio-ruby'
require 'mailgun'
require 'rubygems'

task :send_joke do
  new_message = Messages.new("+19087231020")
  new_message.send_text

end


task :send_news do
  new_email = Email.new("i.rishikrishnan@gmail.com")
  new_email.send_my_email

end
