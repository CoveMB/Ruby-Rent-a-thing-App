class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      record.include(:user, :image)
    end
  end

  def create?
    return true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    return true if user == record.user || user.admin
  end
end
