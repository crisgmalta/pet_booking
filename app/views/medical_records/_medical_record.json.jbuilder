json.extract! medical_record, :id, :pet_id, :symptoms, :treatment, :created_at, :updated_at
json.url medical_record_url(medical_record, format: :json)
