ClioInOutStub::Application.routes.draw do

  resources :teams do 
    member do 
      post 'join'
    end
  end


  devise_for :users

  resources :users, :only => [:index, :show, :edit, :update] do
    member do
      get :status
    end
  end

  root :to => "users#index"
  
end
