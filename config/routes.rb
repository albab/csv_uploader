Rails.application.routes.draw do
  root 'addresses#index'
  post 'import' => 'addresses#create'
end
