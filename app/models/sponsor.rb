class Sponsor < ApplicationRecord

  validates :company_name, presence: true
  validates :description, presence: true
  validates :event_id, uniqueness: {scope: :company_name}

  mount_uploader :image, ImageUploader

  private

  def titleized_title
    company_name.titleize
  end
  
end
