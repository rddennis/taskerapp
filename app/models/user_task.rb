class UserTask < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :description, :due_date
end
