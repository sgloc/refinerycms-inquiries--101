Refinery::Application.routes.draw do
  
  match "/contact" => redirect("/sistema-para-locadora-de-veiculos/contato")
  get '/sistema-para-locadora-de-veiculos/contato', :to => 'inquiries#new', :as => 'new_inquiry'
  resources :contact,
            :only => :create,
            :as => :inquiries,
            :controller => 'inquiries' do
    collection do
      get :thank_you
    end
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :inquiries, :only => [:index, :show, :destroy] do
      collection do
        get :spam
      end
      member do
        get :toggle_spam
      end
    end
    resources :inquiry_settings, :only => [:edit, :update]
  end
end
