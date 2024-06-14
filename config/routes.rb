Rails.application.routes.draw do

  # RUTA PRINCIPAL
  root 'home#index'

  # RUTAS PARA AUTENTICACIÓN DE USUARIOS
  devise_for :users

  # RUTAS PARA GESTIÓNN DE PROYECTOS Y TAREAS RESPECTIVAS
  resources :projects do
    resources :tasks
  end

  get "up" => "rails/health#show", as: :rails_health_check


end
