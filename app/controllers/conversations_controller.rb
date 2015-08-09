class ConversationsController < ApplicationController
  before_action :require_login
  helper_method :mailbox, :conversation

  def new
  end

  def create
    recipient = User.find_by(id: params[:conversation][:recipient_id])
    conversation = current_user.send_message(recipient, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:success] = 'Your message was succesfully sent!'

    redirect_to conversation_path(conversation)
  end

  def show
    @receipts = conversation.receipts_for(current_user)
    conversation.mark_as_read(current_user)
  end

  def reply
    current_user.reply_to_conversation(conversation, params[:message][:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end

end
