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


	def edit
		@message = Remessage.find(params[:id])

		render "_edit_message_nickname_form", layout: false
	end

    def update
    	@message = Remessage.find(params[:id])
    	# contact = message.contact
    	# redirect_to action: :index
    	respond_to do |format|
	    	if change_nickname_for_remessages
	    		@text = @message.contact.nickname
				@redirect_url = apps_remessages_path
				@field_name = :fromUserName
				format.html { redirect_to message, notice: 'Entry was successfully updated.' }
				# format.json { render "layouts/json/_json_editable_sucess", status: :created}
				format.json { render "layouts/json/_json_editable_success", status: :created}
			else
			end

		end
  #   	respond_to do |format|
  #   		if contact.nil?
		# 		contact = Contact.new
		# 		contact.openid = message.fromUserName
		# 		contact.nickname = params[:remessage][:fromUserName]
		# 		Remessage.where("")
		# 		message.contact = contact
		# 		contact.remessages << message

		# 		if contact.save
		# 			@text = contact.nickname
		# 			@redirect_url = apps_remessages_path
		# 			format.html { redirect_to message, notice: 'Entry was successfully updated.' }
		# 			# format.json { render "layouts/json/_json_editable_sucess", status: :created}
		# 			format.json { redirect_to "layouts/json/_json_editable_sucess", status: :created}
		# 		else
		# 		end
  #   		else
		# 		if contact.update_attribute('nickname', params[:contact][:nickname])
		# 			@text = params[:contact][:nickname]
		# 			@redirect_url = apps_remessages_path
		# 			format.html { redirect_to message, notice: 'Entry was successfully updated.' }
		# 			# format.json { render "layouts/json/_json_editable_sucess", status: :created}
		# 			format.json { redirect_to "layouts/json/_json_editable_sucess", status: :created}
		# 		else
					
		# 		end    			
  #   		end

		# end
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

	def change_nickname_for_remessages
		contact = @message.contact
		if contact.nil?
			contact = Contact.new
			contact.openid = @message.fromUserName
			contact.nickname = params[:remessage][:fromUserName]

			@message.contact = contact
			contact.remessages << @message
			if contact.save
				Remessage.where({fromUserName: contact.openid}).update_all(contact_id: contact.id)
				return true
			else
				return false
			end
		else
			# contact.nickname = params[:contact][:nickname]
			# @message.contact = contact
			nickname = params[:contact][:nickname]
			if nickname.empty?
				contact.remessages.update_all(contact_id: nil)
				if contact.destroy
					return true
				else
					return false
				end
			end

			if contact.update_attribute('nickname', params[:contact][:nickname])
				return true
			else
				return false
			end

		end
		
	end
end
