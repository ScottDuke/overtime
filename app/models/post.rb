class Post < ApplicationRecord
  validates_presence_of :date, :rationale, message: "can't be blank"
end
