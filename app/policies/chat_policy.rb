class ChatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.existing_chats_users
    end
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def index?
    return true
  end

  private

  def user_is_owner_or_admin?
    return true if user == record.user || user.admin
  end
end
