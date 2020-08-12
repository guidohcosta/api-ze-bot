Rails.application.routes.draw do
  resources :orders, only: [] do
    member do
      get :track
    end
  end
end
