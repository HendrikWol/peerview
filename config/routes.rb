Rails.application.routes.draw do


  devise_for :teachers, path: 'teachers', controllers: { registrations: "teachers/registrations" }
  devise_for :students, path: 'students', controllers: { registrations: "students/registrations" }
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
