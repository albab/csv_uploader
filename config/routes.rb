Rails.application.routes.draw do
  root 'addresses#index'
  post 'import' => 'addresses#import'
end
