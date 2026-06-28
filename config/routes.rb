Rails.application.routes.draw do
  root "trading_days#index"

  resources :trading_days, only: [ :index, :show ]
end
