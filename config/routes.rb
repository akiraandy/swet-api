Rails.application.routes.draw do

  resources :users do
    resources :workouts do
      resources :exercises
    end
  end
end
