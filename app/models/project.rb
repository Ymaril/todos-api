class Project < ApplicationRecord
  validates :title, presence: true
  has_many :todos

  def as_json(options = {})
    super(include: :todos)
  end
end
