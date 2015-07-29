class ProfilesController < ApplicationController
    def new 
       #form where a user can fill out their OWN profile
       @user = User.find(params[:user_id])
       
       # Disabled this because it will break the /users/:id show link every time after /users/:id/new is called
       #@profile = @user.build_profile #method is available because profile is a nested resource in users (routes file)
        
        @profile = Profile.new
    end
    
    def create
        @user = User.find(params[:user_id])
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success] = "Profile Updated"
           redirect_to user_path(params[:user_id])
        else
            render action: :new #render the new action in this controller
        end
        
    end
    
    
    private
        def profile_params
           params.require(:profile).permit(:first_name,:last_name,:job_title,:phone_number,:contact_email,:description) 
            
        end
    
    
end 