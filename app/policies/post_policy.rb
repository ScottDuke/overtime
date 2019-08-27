class PostPolicy < ApplicationPolicy

  def update?
    return true if record.approved? && user.is_admin?
    user_or_admin && !record.approved?
  end

  private
  
  def user_or_admin
    user.is_admin? || record.user_id == user.id
  end

end