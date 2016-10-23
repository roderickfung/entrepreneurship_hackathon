class Participant < ApplicationRecord

  belongs_to :event

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: VALID_EMAIL_REGEX

  private

  def full_name
    "#{first_name} #{last_name}".squeeze(' ').strip.titleize
  end

end
