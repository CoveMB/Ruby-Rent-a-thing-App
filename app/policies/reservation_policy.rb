class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      record.includes(:item, :user)
    end
  end

  def create?
    user_is_renter_or_admin?
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    return true if user == record.item.user || user.admin
  end

  def user_is_renter_or_admin?
    return true if user == record.user || user.admin
  end
end
