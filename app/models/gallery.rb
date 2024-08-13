class Gallery < ApplicationRecord
  belongs_to :user
  has_many :applications, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
  validates :price, presence: true, numerically: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
end
