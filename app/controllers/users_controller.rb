class UsersController < ApplicationController
        before_action :authenticate_user!, only: [:show]
        
        def show
                @user = User.find(current_user.id)
        end
        
        def index
                @users = User.all
        end
end