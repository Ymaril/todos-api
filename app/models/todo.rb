class Todo < ApplicationRecord
  validates :text, presence: true
  belongs_to :project
  accepts_nested_attributes_for :project
end
