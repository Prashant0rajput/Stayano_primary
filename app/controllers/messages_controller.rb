class MessagesController < ApplicationController
	before_filter :authenticate_user!

  def show_chat
    @messages = Message.all
  end

 
end
