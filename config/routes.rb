Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }
  
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes/about', as: 'about'
    resources :users, only: [:show, :edit]
  end
end
