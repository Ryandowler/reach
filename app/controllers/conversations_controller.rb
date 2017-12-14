class ConversationsController < ApplicationController
	def index
		@conversations = current_user.mailbox.conversations
	end
	def show
		@conversations = current_user.mailbox.conversations.find(params[:id])
		@conversation = current_user.mailbox.inbox.first
	end
end