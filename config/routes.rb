Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  #登陆
  devise_for :users,controllers: {sessions: 'users/sessions'}
  #学校
  resources :schools do
    #点赞
    post 'upvote'
    #年级
    resources :grades do
      #班级
      resources :classschools do
         #教师操作
	       resources :teacheroperoations do
           #学生
           resources :students
	       end
         #教师
        resources :teachers do
          #学生
          resources :students

          end
        end
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
