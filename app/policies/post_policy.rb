class PostPolicy < ApplicationPolicy

  def update?
    user.is_admin? || record.user_id == user.id
  end

end