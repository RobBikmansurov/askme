class Tag < ApplicationRecord
  # TAG_REGEXP = /#[\wа-яё]+/.freeze
  TAG_REGEXP = /#[[:alpha:]]+/.freeze
  FONT_SIZE_MIN = 10 # cloud tags font-size
  FONT_SIZE_MAX = 30

  before_validation { name&.downcase! }

  has_many :tag_question
  has_many :questions, through: :tag_question

  validates :name, presence: true

  scope :with_questions, -> { includes(:questions).distinct }

  def label
    "##{name}"
  end

  def to_param
    name
  end
end
