class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)

    render("user_templates/index.html.erb")
  end

  def show
    @flight = Flight.new
    @user = User.find(params.fetch("id_to_display"))

    render("user_templates/show.html.erb")
  end

  def new_form
    @user = User.new

    render("user_templates/new_form.html.erb")
  end

  def create_row
    @user = User.new

    @user.email = params.fetch("email")
    @user.password = params.fetch("password")
    @user.phone_number = params.fetch("phone_number")

    if @user.valid?
      @user.save

      redirect_back(:fallback_location => "/users", :notice => "User created successfully.")
    else
      render("user_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @user = User.find(params.fetch("prefill_with_id"))

    render("user_templates/edit_form.html.erb")
  end

  def update_row
    @user = User.find(params.fetch("id_to_modify"))

    @user.email = params.fetch("email")
    @user.password = params.fetch("password")
    @user.phone_number = params.fetch("phone_number")

    if @user.valid?
      @user.save

      redirect_to("/users/#{@user.id}", :notice => "User updated successfully.")
    else
      render("user_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @user = User.find(params.fetch("id_to_remove"))

    @user.destroy

    redirect_to("/users", :notice => "User deleted successfully.")
  end
end
