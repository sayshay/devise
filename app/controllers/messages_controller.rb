class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    @message = Message.create!(message_params)
  end

  def delete_all
    Message.delete_all
    redirect_to messages_path
  end

  private
  def message_params
      params.require(:message).permit(:content)
    end
end
