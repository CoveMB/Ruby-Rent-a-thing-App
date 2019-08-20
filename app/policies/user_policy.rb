class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin
  end

  def show?
    return true
  end

  def update?
    @current_user.admin
  end

  def destroy?
    return false if @current_user == @user

    @current_user.admin
  end
end
