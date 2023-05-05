Rails.application.routes.draw do
 namespace :api do
  namespace :v1 do
    resources :registrations
    resources :articles do
      collection do
        get :nitesh 
      end
    end
 end
end
end