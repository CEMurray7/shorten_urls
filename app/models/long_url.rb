class LongUrl < ApplicationRecord
  validates :url, presence: true, uniqueness: true
end
