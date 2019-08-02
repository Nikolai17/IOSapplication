require "sinatra"
require 'json'

post '/getTopics' do
  foo = params
    content_type :json

    File.open("data.json","a") do |f|
    f.write({"topicName" => foo["topicName"]}.to_json)
    f.write({"authorName" => foo["authorName"]}.to_json)
    f.close
  end
end


post '/post' do
  mas = params

  if mas["login"] == "Volnikov"
    content_type :json
    {"Volnikov" => "True"}.to_json
  elsif mas["login"] == "Platon"
    {"Platon"=>"True"}.to_json
  else
    {"Fail"=>"Fail"}.to_json

  end

end
