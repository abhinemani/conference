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
    r.Pause :length=>"2"
    r.Say 'Welcome to my Conference call to enter please press 1 2 3', :voice => 'woman'
    if params[:Digits] = "123"
    r.Gather :action=>"http://sleepy-river-3449.herokuapp.com/jesse", :method => "GET"
  end
 end  

response.text
end  
  

get '/jesse'  do
  response = Twilio::TwiML::Response.new do |r|
   r.Dial do |d|
    d.Conference "RoomPop", :waitUrl=>"http://com.twilio.music.classical.s3.amazonaws.com/ClockworkWaltz.mp3" ,:startConferenceOnEnter=>"true", :endConferenceOnExit=>"true"
    end
  
  end

response.text

end