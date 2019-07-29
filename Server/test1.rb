require "sinatra"
require 'json'

 # Возвращает массив описаний тем
post '/getTopics' do

    end



post '/post' do
  mas = params

  if mas["login"] == "Volnikov"
    content_type :json
    {"Volnikov" => "True"}.to_json
  elsif mas["login"] == "Platon"
    {"Platon" => "True"}.to_json
  else
    {"Fail"=>"Fail"}.to_json
  end


end
