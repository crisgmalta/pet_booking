class MedicalRecord < ApplicationRecord
  belongs_to :pet

  has_rich_text :symptoms
  has_rich_text :treatment

  validates :symptoms, :treatment, presence: true
end
