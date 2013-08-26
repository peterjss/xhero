class Weixin::WeixinsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :check_weixin_legality

  def auth
    puts 'in auth method.'
    render :text => params[:echostr]
  end

  def reply_text
    puts 'in reply text.'
    puts params[:xml].inspect

    @remessage = Remessage.new
    @remessage[:toUserName] = weixin_xml.to_user
    @remessage[:fromUserName] = weixin_xml.from_user
    @remessage[:msgType] = weixin_xml.type
    @remessage[:content] = weixin_xml.content

    @remessage.save
    #puts params[:xml][:MsgType]



    render 'reply_text', :formats => :xml

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

  def post_params
    params.require(:xml).permit(:name)
  end

end
