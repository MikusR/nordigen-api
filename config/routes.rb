Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "home#index"
  get "results/", to: "results#index"
  get "agreements/:id", to: "agreements#index"

   get "/test", to: ->(env) {
    req=ActionDispatch::Request.new(env)
    puts "this goes to console"
    puts req.params
    [ 200, {}, [ "hello" ] ] }
end
