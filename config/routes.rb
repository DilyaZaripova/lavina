Rails.application.routes.draw do
  #get 'company/index'

  #get 'company/show'

  #get 'company/new'

  #get 'company/edit'

  #get 'company/create'

  #get 'company/update'

  #get 'company/destroy'

  #get 'job/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'api' do
    namespace :v1 do
      resources :jobs
      resources :companies do
        resources :jobs
      end
    end
  end
end