class Speaker < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true
  validates :email, format: VALID_EMAIL_REGEX
  validates :description, presence: true
  validates :participation_year, presence: true, numericality: {greater_than: 2015, less_than_or_equal_to: 2100}, uniqueness: {scope: [:first_name, :last_name]}

  mount_uploader :image, ImageUploader

  def full_name
    "#{first_name} #{last_name}".squeeze(' ').strip.titleize
  end

end
