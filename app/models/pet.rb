class Pet < ApplicationRecord
  has_many :medical_records

  validates :name, :birth_date, :breed, :pet_kind, presence: true
end
