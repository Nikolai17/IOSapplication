require "sinatra"
require 'json'

post '/post' do
  mas = params

  if mas["login"] == "Volnikov"
    content_type :json
    {"Volnikov" => "True"}.to_json
  else
    {"Fail"=>"Fail"}.to_json

  end

end
