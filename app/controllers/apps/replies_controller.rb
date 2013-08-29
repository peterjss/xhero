class Apps::RepliesController < ApplicationController
  def index
    @roles = Rolecard.all
    @role = Rolecard.new
    @total = Rolecard.count
  end


end
