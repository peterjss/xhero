class Apps::RemessagesController < ApplicationController
	def index
		odr = params[:o]
		puts odr
		if odr== nil or odr.index('-') == -1
		  @messages = Remessage.all
		else
		  @messages = Remessage.where.order('#{odr} desc')
		  
		end
		
		@message = Remessage.new
		@total = Remessage.count
	end

	def new
		# @message = Remessage.new
	end

	def show
	end

	def destroy_all
		params[:_selected_action].to_a.each do |mid|
			if @message = Remessage.find(mid)
				@message.destroy
			end 
		end

		redirect_to action: :index
	end

	private
	def post_params
		params.require(:mesage).permit(:name,:code)
	end
end
