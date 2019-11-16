Rails.application.routes.draw do

  root to: "pets#index"

  resources :pets do
    resources :medical_records
  end
end
