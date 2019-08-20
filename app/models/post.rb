class Post < ApplicationRecord

  belongs_to :user

  validates_presence_of :date, :rationale, message: "can't be blank"
end
