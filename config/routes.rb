CinemaWall::Application.routes.draw do
  scope 'cinema_wall' do
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
    root :to => 'application#slides'
  end


end
