class UsersController < ApplicationController
  def index
    @users = OneUpApp::User.all
  end

  def create
  end
end
