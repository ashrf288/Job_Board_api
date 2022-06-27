class JobsController < ApplicationController
  before_action :authenticate_user!
    def index
      @jobs = Job.all 
      render json: @jobs
    end 
  
    def show
      @job = Job.find(params[:id])
      render json: @job
  end
  def create
    if !current_user.is_admin
      render json: {error: "You are not authorized to create a job"}, status: :unauthorized
    else
    @job = Job.create(
        title: params[:title],
        description: params[:description],
        user_id:current_user.id
        
        )
    if @job.save
    render json: {msg: "created successfully", data:@job }
    else
      render json: {msg: "error", data:@job.errors}
    end
  end
  end 
  
  def update
    @job = Job.find(params[:id])
    @job.update(
        title: params[:title] || @job.title,
        description: params[:description] || @job.description,
    )
    render json: @job
  end 
  
    def destroy
      @job = Job.find(params[:id])
      @job.destroy
      render json: {msg: "deleted successfully", data:@job }
  end
  end