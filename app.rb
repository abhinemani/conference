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
    r.Pause :length=>"1"
    r.Say ' Welcome  to  my  Conference call to enter please press 1  2  3 #', :voice => 'woman', :language => 'en'
    if params[:Digits] = "123"
    r.Gather :action=>"/abhi", :method => "GET"
  end
 end  

response.text
end  
  

get '/abhi'  do
  response = Twilio::TwiML::Response.new do |r|
   r.Say "Connecting  you  to  the  conference", :voice => 'woman', :language => 'en'
   r.Dial do |d|
    d.Conference "RoomPop", :waitUrl=>"http://twimlets.com/holdmusic?Bucket=com.twilio.music.classical" ,:startConferenceOnEnter=>"true", :endConferenceOnExit=>"true"
    end
  
  end

response.text

end