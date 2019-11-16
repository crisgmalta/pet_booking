Rails.application.routes.draw do
  resources :pets do
    resources :medical_records
  end
end
