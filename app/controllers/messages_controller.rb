class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  respond_to :html, :js

  def index
    @messages = @conversation.messages

    if @messages.length > 5
      @over_ten = true
      @messages = @messages[-5..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.each do |message|
          message.update(read: 'true')
        end
      end
    end

    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)

    if @message.save
      sync_new @message
    end
    respond_to do |format|
      format.js { head :no_content  }
    end
  end

  def destroy
    @message = @conversation.messages.find(params[:id])
    @message.destroy
    sync_destroy @message

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { head :no_content  }
    end

  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end

end
