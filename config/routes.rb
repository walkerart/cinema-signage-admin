CinemaWall::Application.routes.draw do
  scope 'cinema_wall' do
    ActiveAdmin.routes(self)

    devise_for :admin_users, ActiveAdmin::Devise.config
  end
end
