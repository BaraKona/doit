class Todo < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :priority, presence: true
  validates :status, presence: true

  enum priority: %i[low medium high]
  enum status: %i[not_started in_progress completed]

  scope :completed, -> { where(status: "completed") }
  scope :in_progress, -> { where(status: "in_progress") }
  scope :not_started, -> { where(status: "not_started") }
  scope :high, -> { where(priority: "high") }
  scope :medium, -> { where(priority: "medium") }
  scope :low, -> { where(priority: "low") }

  belongs_to :user

end
