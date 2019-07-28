Rails.application.routes.draw do
  resources :portfolios, except: [:show]

  get "react-items", to: "portfolios#react"
  get "portfolio/:id", to: "portfolios#show", as: 'portfolio_show'
  # get 'pages/home'
  # get 'pages/about'
  # get 'pages/contact'
  get "about-me", to: "pages#about"
  get "contact", to: "pages#contact"
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  get 'portfolios/*missing', to: 'portfolios#missing'
  get 'portfolio/:id/*missing', to: 'portfolios#missing'

  root to: 'pages#home'
end
