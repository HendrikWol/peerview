Rails.application.routes.draw do

  devise_for :teachers, path: 'teachers'
  devise_for :students
  devise_for :users
  root to: 'pages#home'

  resources :assignments
  resources :classrooms
  resources :evaluations
  resources :programs
  resources :students
  resources :teachers
  resources :topics
end
