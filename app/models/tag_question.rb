class TagQuestion < ApplicationRecord
  belongs_to :tag
  belongs_to :question

  scope :with_counts, -> { joins(:tag).group('tags.name').order(:name).count }
end
