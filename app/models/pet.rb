class Pet < ApplicationRecord

  validates :name, :birth_date, :breed, :pet_kind, presence: true

end
