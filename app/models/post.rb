class Post < ApplicationRecord
  belongs_to :user
  def assign_user(user)
    self.user_id = user.id
  end
end
