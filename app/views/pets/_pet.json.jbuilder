json.extract! pet, :id, :name, :birth_date, :breed, :pet_kind, :created_at, :updated_at
json.url pet_url(pet, format: :json)
