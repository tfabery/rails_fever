class MessagesController < ApplicationController

  def create
    binding.pry
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.body,
        user: message.user.username
      head :ok
    end
  end

  private

    def message_params
      params.require(:message).permit(:body, :room_id)
    end
end
