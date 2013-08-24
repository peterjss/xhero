class WeixinsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_filter :check_weixin_legality

  def auth
    puts 'in auth method.'
    render :text => params[:echostr]
  end

  def reply_text
    puts 'in reply text.'

    puts weixin_xml.type
    puts weixin_xml.from_user
    puts weixin_xml.to_user
    puts weixin_xml.content
    render 'reply_text', status:200
    #puts params[:xml][:ToUserName]
    #puts params[:xml][:Content]
    #  render "reply_text"
  end

  private
  def check_weixin_legality
    array = [Rails.configuration.weixin_token, params[:timestamp], params[:nonce]].sort
    #puts Digest::SHA1.hexdigest(array.join)
    render text: "Forbidden", status: 403 if params[:signature] != Digest::SHA1.hexdigest(array.join)

    #array = [Rails.configuration.weixin_token, params[:timestamp], params[:nonce]].sort
    #render text: "Forbidden", status: 403 if params[:signature] != Digest::SHA1.hexdigest(array.join)
  end

end
