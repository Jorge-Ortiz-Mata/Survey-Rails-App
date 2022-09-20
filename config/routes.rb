Rails.application.routes.draw do

  get "/audits/:id/:token_id/:step", to: "audits#index", as: "audits_index"
  post "/save/answers", to: "audits#save_answers", as: "audits_save_answers"
  get "/finish", to: "audits#finish", as: "audits_finish"

  resources :surveys do
    get "add/emails", to: "surveys#add_emails"
    post "send/survey", to: "surveys#send_survey_by_email"

    get "add/sections", to: "survey_sections#add_sections"
    post "save/sections", to: "survey_sections#save_sections"
    delete "delete/section", to: "survey_sections#delete_section"
    patch "up/section", to: "survey_sections#up_section"
    patch "down/section", to: "survey_sections#down_section"
  end

  resources :questions do
    post "option/create", to: "options#create"
    get "option/edit", to: "options#edit"
    patch "option/update", to: "options#update"
    delete "option/destroy", to: "options#destroy"
  end

  resources :sections do
    post "question/create", to: "questions#create"
    get "question/edit", to: "questions#edit"
    patch "question/update", to: "questions#update"
    delete "question/destroy", to: "questions#destroy"
  end

  resources :chapters do
    get 'body/edit', to: "chapters#body"
  end

  resources :evaluations

  devise_for :users

  authenticated(:user) do
    root "pages#index", as: :authenticated_root
  end

  unauthenticated(:user) do
    root "pages#landing_page"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
