Sora::Application.routes.draw do
  namespace :admin do
    root 'articles#index'

    resources :articles
  end
end