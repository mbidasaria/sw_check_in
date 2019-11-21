Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "users#index"
  # Routes for the Flight resource:

  # CREATE
  get("/flights/new", { :controller => "flights", :action => "new_form" })
  post("/create_flight", { :controller => "flights", :action => "create_row" })

  # READ
  get("/flights", { :controller => "flights", :action => "index" })
  get("/flights/:id_to_display", { :controller => "flights", :action => "show" })

  # UPDATE
  get("/flights/:prefill_with_id/edit", { :controller => "flights", :action => "edit_form" })
  post("/update_flight/:id_to_modify", { :controller => "flights", :action => "update_row" })

  # DELETE
  get("/delete_flight/:id_to_remove", { :controller => "flights", :action => "destroy_row" })
  get("/delete_flight_from_user/:id_to_remove", { :controller => "flights", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the User resource:

  # CREATE
  get("/users/new", { :controller => "users", :action => "new_form" })
  post("/create_user", { :controller => "users", :action => "create_row" })

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  # UPDATE
  get("/users/:prefill_with_id/edit", { :controller => "users", :action => "edit_form" })
  post("/update_user/:id_to_modify", { :controller => "users", :action => "update_row" })

  # DELETE
  get("/delete_user/:id_to_remove", { :controller => "users", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
