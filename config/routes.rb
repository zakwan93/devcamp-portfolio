Rails.application.routes.draw do
  resources :portfolios
  # get 'pages/home'
  # get 'pages/about'
  # get 'pages/contact'
  get "about-me", to: "pages#about"
  get "contact", to: "pages#contact"
  resources :blogs
  
  root to: 'pages#home'
end
