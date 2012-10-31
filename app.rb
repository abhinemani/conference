require 'sinatra'
require 'rubygems'
require 'httparty'
require 'twiliolib'
require 'twilio-ruby'

before do
content_type :xml
end


get '/' do
  
 response = Twilio::TwiML::Response.new do |r|
    r.Pause :length=>"5"
    r.Say 'Welcome to Daycare #1', :voice => 'woman'
    if params[:Digits] = 123
    r.Gather :action=>"http://sleepy-river-3449.herokuapp.com/jesse", :method => "GET"
  end
 end  

response.text
end  
  

get '/jesse'  do
  response = Twilio::TwiML::Response.new do |r|
   r.Dial do |d|
    d.Number "+13476108367"
   end
  end

response.text

end