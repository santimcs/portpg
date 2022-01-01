Rails.application.routes.draw do
  resources :profits
  resources :stocks
  resources :charts
  resources :tickers
  resources :epss
  resources :yr_profits  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tickers#index"

  get "/list_profits_q1", to: 'profits#list_profits_q1'    
  get "/list_profits_q2", to: 'profits#list_profits_q2'    
  get "/list_profits_q3", to: 'profits#list_profits_q3'    
  get "/list_profits_q4", to: 'profits#list_profits_q4'     
  get "/list_tickers", to: 'tickers#list_tickers'    

end
