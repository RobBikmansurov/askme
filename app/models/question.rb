class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  scope :answered, -> { where.not(answer: nil) }
  scope :not_answered, -> { where(answer: nil) }

  validates :text, presence: true
  validates :text, length: { maximum: 255 }
end
