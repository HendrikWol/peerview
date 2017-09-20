Rails.application.routes.draw do


  devise_for :teachers, path: 'teachers', controllers: { registrations: "teachers/registrations" }
  devise_for :students, path: 'students', controllers: { registrations: "students/registrations" }
  devise_for :users
  root to: 'pages#home'

  resources :classrooms
  resources :evaluations
  resources :programs
  resources :students
  resources :teachers do
    resources :assignments
  end

  resources :topics

  get 'sign_up', to: 'pages#sign_up', as: 'sign_up'
end
