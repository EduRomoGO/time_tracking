Rails.application.routes.draw do
  get '/' => 'site#home'
  get '/contact' => 'site#contact'
  #get '/projects' => 'projects#index'
  ##get '/projects/:id' => 'projects#show'
  #get '/projects/:name' => 'projects#show'
  #get '/projects/:project_id/entries' => 'entries#index'
  #get '/projects/calculate-hours/:id/:year/:month' => 'projects#show_hours'
  #get '/projects/:project_id/entries/new' => 'entries#new'

  resources :projects do
  	resources :entries
  end


end