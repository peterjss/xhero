class Weixin::WeixinsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_filter :check_weixin_legality

  layout "weixin_msg"

  # 空格 (&#x20;) 
  # Tab (&#x09;) 
  # 回车 (&#x0D;) 
  # 换行 (&#x0A;)

  def auth
    puts 'in auth method.'
    render :text => params[:echostr]
  end

  def reply_text_welcome
    puts 'in reply_text_welcome.'
    puts params[:xml].inspect
    save_remessage

    render 'reply_text_welcome', formats: :xml, layout: true
  end

  def reply_text_info
    puts 'in reply_text_info.'
    puts params[:xml].inspect
    save_remessage

    render 'reply_text_info', formats: :xml, layout: true
  end

  def reply_text_news
    @content = "This model is not complete yet."
    render 'reply_text', formats: :xml, layout: true
  end

  def reply_music
    puts 'in reply_music.'
    puts params[:xml].inspect

    save_remessage
    render 'reply_music', formats: :xml, layout: true
  end


  private
  def check_weixin_legality
    array = [Rails.configuration.weixin_token, params[:timestamp], params[:nonce]].sort
    render text: "Forbidden", status: 403 if params[:signature] != Digest::SHA1.hexdigest(array.join)
  end

  def save_remessage
    @remessage = Remessage.new
    @remessage[:toUserName] = weixin_xml.to_user
    @remessage[:fromUserName] = weixin_xml.from_user
    @remessage[:msgType] = weixin_xml.type
    @remessage[:content] = weixin_xml.content
    @remessage.save
  end

  def post_params
    params.require(:xml).permit(:msgType)
  end

end
