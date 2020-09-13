class Tag < ApplicationRecord
  TAG_REGEXP = /#[\wа-яё]+/.freeze

  before_validation { name&.downcase! }

  has_many :tag_question
  has_many :questions, through: :tag_question

  validates :name, presence: true

  def to_param
    name
  end
end
