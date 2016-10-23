class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: VALID_EMAIL_REGEX
  validates :password, length: {minimum: 6}, on: [:create, :update]
  validates :password_confirmation, presence: {message: 'Password cannot be blank'}

  before_create { generate_token(:auth_token) }

  def full_name
    "#{first_name} #{last_name}".squeeze(' ').strip.titleize
  end

  private

  def generate_token(column)
    begin
      self[column] = SecureRandom.hex(64)
    end while User.exists?(column => self[column])
  end

  def set_admin_defaults
    self.admin ||= false
  end

  def set_approved_defaults
    self.activated ||= false
  end

end
