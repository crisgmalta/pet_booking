class MedicalRecord < ApplicationRecord
  belongs_to :pet

  has_rich_text :symptoms
  has_rich_text :treatment
end
