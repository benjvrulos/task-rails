Rails.application.routes.draw do

  # RUTA PRINCIPAL
  authenticated :user do
    root to: 'projects#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')

  # RUTAS PARA AUTENTICACIÓN DE USUARIOS

  devise_for :users

  # RUTAS PARA GESTIÓNN DE PROYECTOS Y TAREAS RESPECTIVAS
  resources :projects do
    resources :tasks
  end

  get "up" => "rails/health#show", as: :rails_health_check


end
