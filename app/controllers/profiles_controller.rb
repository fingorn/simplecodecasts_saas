class ProfilesController < ApplicationController
    def new 
       #form where a user can fill out their OWN profile
       @user = User.find(params[:user_id])
       @variable = params[:hello]
       @profile = @user.build_profile #method is available because profile is a nested resource in users (routes file)
        
    end
    
end