class WelcomeController < ApplicationController
  require 'net/http'



  def index
    #render "http://192.168.115.128:3000/weixin/io?signature=89a9f12f059be4507fe7a964da20fc2026dd28db&timestamp=1377313474&nonce=1377731386"
    url = URI.parse('http://192.168.115.128:3000/weixin/io?signature=89a9f12f059be4507fe7a964da20fc2026dd28db&timestamp=1377313474&nonce=1377731386')
    Net::HTTP.start(url.host, url.port) do |http|
      req = Net::HTTP::Post.new(url.path)
      req.set_form_data(render "index",formats: :xml)

      puts http.request(req).body
    end

    #render "index", formats: :xml
  end
end
