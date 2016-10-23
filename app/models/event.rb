class Event < ApplicationRecord

  has_many :speakers, dependent: :nullify
  has_many :sponsors, dependent: :nullify
  has_many :participants, dependent: :nullify

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :aasm_state, presence: true

  include AASM

  aasm whiny_transitions: false do
    state :draft, initial: true
    state :published
    state :current
    state :canceled
    state :completed

    event :publish do
      transitions from: :draft, to: :published
    end

    event :cancel do
      transitions from: [:draft, :published], to: :canceled
    end

    event :now do
      transitions from: [:draft, :published], to: :current
    end

    event :end do
      transitions from: :current, to: :completed
    end

  end

  def titleized_title
    title.titleize
  end

end
