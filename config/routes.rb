Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/uitest", to: "pages#uitest"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :properties do
    resources :property_applications, only: [:index, :new, :create]
  end

  resources :property_applications, only: [:show, :edit, :update] do
    resources :bank_references, only: [:index, :new, :show, :create, :edit]
    resources :employment_documents, only: [:index, :new, :show, :create, :edit]
    resources :identifications, only: [:index, :new, :show, :create, :edit, :destroy]
    resources :messages
  end

end
