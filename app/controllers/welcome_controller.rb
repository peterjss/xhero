class WelcomeController < ApplicationController
  require 'net/http'
  # layout "test_msg"


  def index
    @user = User.new
    #render "http://192.168.115.128:3000/weixin/io?signature=89a9f12f059be4507fe7a964da20fc2026dd28db&timestamp=1377313474&nonce=1377731386"
    # url = URI.parse('http://192.168.115.128:3000/weixin/io?signature=89a9f12f059be4507fe7a964da20fc2026dd28db&timestamp=1377313474&nonce=1377731386')
    # Net::HTTP.start(url.host, url.port) do |http|
    #   req = Net::HTTP::Post.new(url.path)
    #   req.set_form_data(render "index",formats: :xml)

    #   puts http.request(req).body
    # end

# <xml>
#      <ToUserName><![CDATA[<%= params[:xml][:ToUserName] %>]]></ToUserName>
#      <FromUserName><![CDATA[<%= params[:xml][:FromUserName] %>]]></FromUserName>
#      <CreateTime><%= Time.now.to_i %></CreateTime>
#      <MsgType><![CDATA[text]]></MsgType>
#      <Content><![CDATA[You say: <%= params[:xml][:Content] %>?]]></Content>
# </xml>

#     params[:xml] = {"<xml><ToUserName><![CDATA[ToUserName]]></ToUserName><FromUserName><![CDATA[FromUserName]]></FromUserName><CreateTime>123213123</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[Content]]></Content></xml>"}
#     params[:xml][:ToUserName] = 'ToUserName'
#     params[:xml][:FromUserName] = 'FromUserName'
#     params[:xml][:CreateTime] = '123213123'
#     params[:xml][:MsgType] = 'text'
#     params[:xml][:Content] = 'Content'
    # @ToUserName = 'ToUserName'
    # @FromUserName = 'FromUserName'
    # @CreateTime = '123213123'
    # @MsgType = 'text'
    # @Content = 'Content'

    # render action: "weixin/weixins#reply_text"
    # render "index", formats: :xml, layout:true
  end

  def login
    if request.post?
      @user = User.authenticate(params[:user][:username], params[:user][:password])
      if @user
        session[:user_id]= @user.id
        redirect_to(controller:'home')
      else
        flash[:notice] = 'Name or password failed.'
      end
    end
  end

end
