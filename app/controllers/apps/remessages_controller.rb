class Apps::RemessagesController < ApplicationController
	def index
		odr = params[:o]
		puts odr
		if odr== nil or odr.index('-') == -1
		  @messages = Remessage.all
		else
		  @messages = Remessage.where.order('#{odr} desc')
		end

		@total = Remessage.count
	end

	def new
		@messages = Remessage.new
	end

	def show
		
	end

	private
	def post_params
		params.require(:mesage).permit(:name,:code)
	end
end
