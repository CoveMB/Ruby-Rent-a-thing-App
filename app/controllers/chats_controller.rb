require 'securerandom'

class ChatsController < ApplicationController
  def index
    chats = current_user.chats
    @existing_chats_users = policy_scope(Chat)
  end

  def create
    current_user.new_message = false
    current_user.save
    @other_user = User.find(params[:other_user])
    @chat = find_chat(@other_user) || Chat.new(identifier: SecureRandom.hex)
    authorize @chat
    unless @chat.persisted?
      @chat.save
      @chat.subscriptions.create(user_id: current_user.id)
      @chat.subscriptions.create(user_id: @other_user.id)
    end
    redirect_to user_chat_path(current_user, @chat, other_user: @other_user.id)
  end

  def show
    @other_user = User.find(params[:other_user])
    @chat = Chat.find_by(id: params[:id])
    authorize @chat
    @message = Message.new
  end

  private

  def find_chat(second_user)
    chats = current_user.chats
    chats.each do |chat|
      chat.subscriptions.each do |s|
        return chat if s.user_id == second_user.id
      end
    end
    nil
  end

  def require_login
    redirect_to new_session_path unless logged_in?
  end
end
