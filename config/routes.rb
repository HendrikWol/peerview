Rails.application.routes.draw do


  devise_for :teachers, path: 'teachers', controllers: { registrations: "teachers/registrations", passwords: 'teachers/passwords' }
  devise_for :students, path: 'students', controllers: { registrations: "students/registrations", passwords: 'students/passwords' }
  devise_for :users
  root to: 'pages#home'

  resources :classrooms
  resources :evaluations
  resources :programs
  resources :students
  resources :teachers do
    resources :assignments, except: [:show]
  end

  resources :assignments, only: [:show] do
    resources :papers
  end
  resources :topics

  get 'sign_up', to: 'pages#sign_up', as: 'sign_up'
end
