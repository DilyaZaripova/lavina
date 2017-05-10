Rails.application.routes.draw do
  #get 'apply/index'

  #get 'geek/index'

  #match "*path", to: "application#catch_404", via: :all
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
      resources :jobs do
        resources :applies
      end
      resources :companies do
        resources :jobs do
          resources :applies
        end
      end

      match 'destroy', to: 'companies#destroy', via: :post

      resources :geeks do
        resources :applies
      end
      resources :applies
    end
  end

end