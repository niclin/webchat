class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
  end


  def create

    if Conversation.between(params[:sender_id],params[:recipient_id])
      .present?
      @conversation = Conversation.between(params[:sender_id],
                                           params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)

      @friendship = current_user.friendships.build(:friend_id => params[:recipient_id])
      @friendship.save

      @friend = User.find(params[:recipient_id])
      @friendship = @friend.friendships.build(:friend_id => current_user.id)
      @friendship.save
    end

    redirect_to conversation_messages_path(@conversation)
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

end
