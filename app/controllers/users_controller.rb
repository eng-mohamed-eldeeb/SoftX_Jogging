class UsersController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource



    
    
    
    
    def index
        @users = User.all
        render json: @users
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
    
    # users/show/:id
    def show
        @user = User.find(params[:id])
        render json: @user.as_json(only: [:email, :role, :id], include: :jogging_times)
    end
    
    def update
        # users/create/:id
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: @user, status: :ok
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            render json: @user, status: :ok
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def weekly_report
        # Find the user
        user = User.find(params[:id])
      
        # Group jogging times by week
        jogging_times_by_week = user.jogging_times.group_by { |jt| jt.date.beginning_of_week }
      
        # Calculate average distance and speed each week
        weekly_averages = jogging_times_by_week.transform_values do |jogging_times|
          distances = jogging_times.pluck(:distance).map(&:to_f)
          total_distance = distances.sum
          total_time = jogging_times.sum { |jt| jt.time.to_i }.to_i
          average_speed = total_distance / (total_time / 3600.0) # Speed in km/h
          {
            distance: (total_distance / distances.size).round(2), # Average distance in km
            speed: average_speed.round(2) # Average speed in km/h
          }
        end
      
        # Render the report as JSON
        render json: {
          user: user.email,
          weekly_averages: weekly_averages
        }
      end
      
    
    
    
    def filter_jogging_times_by_dates
        @user = User.find(params[:id])
        from_date = params[:from_date]
        to_date = params[:to_date]
        @jogging_times = @user.jogging_times.where(date: from_date..to_date)
        render json: {
          @user => {
            email: @user.email,
            role: @user.role,
            jogging_times: @jogging_times
          }
        }
    end

    private
    
    def user_params
        params.require(:user).permit(:email, :password, :role)
    end
    
end
