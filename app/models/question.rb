class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_many :tag_questions, dependent: :destroy
  has_many :tags, through: :tag_questions

  scope :answered, -> { where.not(answer: nil) }
  scope :not_answered, -> { where(answer: nil) }

  validates :text, presence: true
  validates :text, length: { maximum: 255 }

  after_commit :update_tags, on: %i[create update]

  private

  def update_tags
    tag_questions.clear
    "#{text} #{answer}".downcase.scan(Tag::TAG_REGEXP).uniq.each do |tag|
      tags << Tag.find_or_create_by(name: tag[1..])
    end
  end
end
