Rails.application.routes.draw do

  resources :users, shallow: true do
    resources :workouts do
      resources :exercises do
        resources :batches do
          resources :reps
        end
      end
    end
  end
end
