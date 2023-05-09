class JoggingTimesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @jogging_times = current_user.jogging_times.all
    render json: @jogging_times
  end

  def show
    @jogging_time = current_user.jogging_times.find(params[:id])
    render json: @jogging_time
  end

  def create
    @jogging_time = current_user.jogging_times.new(jogging_time_params)
    if @jogging_time.save
      render json: @jogging_time, status: :created
    else
      render json: @jogging_time.errors, status: :unprocessable_entity
    end
  end

  def update
    @jogging_time = current_user.jogging_times.find(params[:id])
    if @jogging_time.update(jogging_time_params)
      render json: @jogging_time, status: :ok
    else
      render json: @jogging_time.errors, status: :unprocessable_entity
    end
  end

  # users/destroy/:id
  def destroy
    @jogging_time = current_user.jogging_times.find(params[:id])
    @jogging_time.destroy
    head :no_content
  end

  # I created the admin methods separately because I didn't want to mix them with the user methods and for maintenance

  # jogging_times/add-jogging-times-to-user
  def add_records_to_user_by_admin
    if current_user.admin?
      @jogging_time = JoggingTime.new(jogging_time_add_records_to_user_by_admin_params)
      if @jogging_time.save
        render json: @jogging_time, status: :created
      else
        render json: @jogging_time.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You are not admin' }, status: :unprocessable_entity
    end
  end

  # jogging_times/remove-jogging-times-to-user
  def remove_records_from_user_by_admin
    if current_user.admin?
      @jogging_time = JoggingTime.find(jogging_time_remove_records_to_user_by_admin_params[:jogging_time_id])
      @jogging_time.destroy
      head :no_content
    else
      render json: { error: 'You are not admin' }, status: :unprocessable_entity
    end
  end

  # jogging_times/update-jogging-times-to-user
  def update_a_user_records_by_admin
    if current_user.admin?
      @jogging_time = JoggingTime.find(jogging_time_update_records_to_user_by_admin_params[:jogging_time_id])
      if @jogging_time.update(jogging_time_add_records_to_user_by_admin_params)
        render json: @jogging_time, status: :ok
      else
        render json: @jogging_time.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'You are not admin' }, status: :unprocessable_entity
    end
  end

  # jogging_times/show-jogging-times-to-user
  def show_user_records_by_admin
    if current_user.admin?
      @jogging_times = JoggingTime.where(user_id: params[:id])
      render json: @jogging_times
    else
      render json: { error: 'You are not admin' }, status: :unprocessable_entity
    end
  end



  private

  def show_user_records_by_admin_params
    params.require(:jogging_time).permit(:id)
  end

  def jogging_time_add_records_to_user_by_admin_params
    params.require(:jogging_time).permit(:distance, :time, :date, :user_id)
  end

  def jogging_time_update_records_to_user_by_admin_params
    params.require(:jogging_time).permit(:distance, :time, :date, :user_id, :jogging_time_id)
  end

  def jogging_time_remove_records_to_user_by_admin_params
    params.require(:jogging_time).permit(:jogging_time_id)
  end

  def jogging_time_params
    params.require(:jogging_time).permit(:distance, :time, :date)
  end
end
