class Pet < ApplicationRecord
  PET_KIND = ["Cachorro", "Gato"].freeze

  has_many :medical_records

  validates :name, :birth_date, :breed, :pet_kind, presence: true
  validates :pet_kind, inclusion: { in: PET_KIND }
end
