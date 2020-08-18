Rails.application.routes.draw do
  resources :orders do
    member do
      get :track
    end
  end
end
