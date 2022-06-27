class JobApplicantsController < ApplicationController
  before_action :set_job_applicant, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /job_applicants
  def index
    if current_user.is_admin
    @job_applicants = JobApplicant.all

    render json: @job_applicants
    else
      render json: { error: 'You are not authorized to view this data' }, status: :unauthorized
    end
  end

  # GET /job_applicants/1
  def show
    if current_user.is_admin
    @job_applicant.status="Seen"
    render json: @job_applicant
    else
      render json: { error: "You are not authorized to view this page" }, status: :unauthorized
    end
  end


# GET /job_applicants_byJobID/1
  def showByJobID
    if current_user.is_admin
   @jobs=JobApplicant.where(job_id: params[:id])
    render json: @jobs
    else
      render json: { error: "You are not authorized to view this page" }, status: :unauthorized
      end
  end

  # POST /job_applicants
  def create
     @job_applicant=JobApplicant.find_by(job_id:params[:job_id],
     user_id: current_user.id)
      if !@job_applicant
    @job_applicant = JobApplicant.new(
      job_id: params[:job_id],
      user_id: current_user.id,
    )
    if @job_applicant.save
      render json: @job_applicant, status: :created, location: @job_applicant
    else
      render json: @job_applicant.errors, status: :unprocessable_entity
    end
  else
    render json: {error: "You have already applied for this job"}, status: :unauthorized
  end
  end

  # PATCH/PUT /job_applicants/1
  def update
    if @job_applicant[:user_id]==current_user.id
     if @job_applicant.update(job_id: params[:job_id])
      render json: @job_applicant
    else
      render json: @job_applicant.errors, status: :unprocessable_entity
    end
  else
    render json: {error: "You are not authorized to update this application"}, status: :unauthorized
  end
  end

  # DELETE /job_applicants/1
  def destroy
    if @job_applicant[:user_id]==current_user.id
       @job_applicant.destroy
       render json: {message: "Application removed"}
    else
      render json: {error: "You are not authorized to delete this application"}, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_applicant
      @job_applicant = JobApplicant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_applicant_params
      params.fetch(:job_applicant, {})
    end
end
