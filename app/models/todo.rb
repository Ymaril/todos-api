class Todo < ApplicationRecord
  validates :text, presence: true
  belongs_to :project
end
