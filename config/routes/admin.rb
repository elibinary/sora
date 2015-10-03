Sora::Application.routes.draw do
  namespace :admin do
    root 'articles#index'
  end
end