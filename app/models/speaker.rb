class Speaker < ApplicationRecord
  belongs_to :event

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true
  validates :email, presence: true, format: VALID_EMAIL_REGEX
  validates :description, presence: true
  validates :event_id, uniqueness: {scope: :email}

  mount_uploader :image, ImageUploader

  private

  def full_name
    "#{first_name} #{last_name}".squeeze(' ').strip.titleize
  end

  def titleized_title
    title.titleize
  end

end
