Rails.application.routes.draw do
  resources :schools do
    resources :grades do
      resources :classschools do
	resources :teacheroperoations do
           resources :students
	end
        resources :teachers do
           resources :students

        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
