Rails.application.routes.draw do

  resources :meetings
   devise_for :admins

  resources :shops, only: [:new, :edit]
  resources :reservations, only: [:index, :new, :show, :edit, :create, :destroy]
  resources :admins, only: [:index, :update, :destroy]
  resources :menus, only: [:edit,:create, :update, :delete]
  root 'menus#top'
  get 'reservations/done' => "reservation#done", as: "reservation_done"
  get 'menus/top' => "menus#top", as: "top"
  get 'menus/course' => "menus#course", as: "course"
  post 'menus/course' => "menus#create", as: "course_new"
  get 'menus/access' => "menus#access", as: "access"
  get 'menus/note' => "menus#note", as: "note"
  post 'menus/note' => "menus#create_note"
  get 'menus/:id/edit_note' => "menus#edit_note", as: "edit_note"
  patch 'menus/:id/edit_note' => "menus#update_note"
  delete 'menus/:id/edit_note' => "menus#destroy_note"
  get 'menus/add' => "menus#add", as: "add_menu"
  get '/menus/:id/edit_menu' => "menus#edit_menu", as: "renew_menu"
  patch '/menus/:id/edit_menu' => "menus#update_menu"
  delete '/menus/:id/edit_menu' => "menus#destroy"
  get '/reservations/done' => 'reservations#done'
  get '/calendar/:date' => "reservations#date", as: "reservation_date"
  get '/reservation_time/:date' => "reservations#time", as: "reservation_time"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
