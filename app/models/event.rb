class Event < ActiveRecord::Base
  attr_accessible :name, :hashtag

  before_save { |event| event.hashtag = hashtag.downcase }

  validates :name, presence: true, length: { maximum: 100 }
  VALID_HASHTAG_REGEX = /\A\w+\z/i
  validates :hashtag, presence: true,
                      length: { maximum: 50 },
                      format: { with: VALID_HASHTAG_REGEX },
                      uniqueness: { case_sensitive: false }

end
