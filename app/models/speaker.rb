class Speaker < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true
  validates :email, format: VALID_EMAIL_REGEX
  validates :description, presence: true
  validates :participation_year, presence: true, uniqueness: {scope: [:first_name, :last_name]}

  validate participation_year_cannot_be_in_the_past

  mount_uploader :image, ImageUploader

  def full_name
    "#{first_name} #{last_name}".squeeze(' ').strip.titleize
  end

  def participation_year_cannot_be_in_the_past
    errors.add(:participation_year, 'Cannot be in the past') if !participation_year.blank? and participation_year.year < Date.today.year
  end

end
