Rails.application.routes.draw do
  resources :bank_accounts, only: [:index, :create, :show]
end
