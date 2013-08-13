Karmaville::Application.routes.draw do

resources :users, :only => [:index]

root :to => "users#index"#, :page => 1
end
