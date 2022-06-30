class JobApplicantsController < ApplicationController
  before_action :set_job_applicant, only: %i[ show update destroy ]
  before_action :authenticate_user!
  load_and_authorize_resource 

  # GET /job_applicants
  def index
    authorize! :read, @job_applicants
    render json: @job_applicants
  end

  # GET /job_applicants/1
  def show
    @job_applicant.status="Seen"
    authorize! :show, @job_applicant
    render json: @job_applicant

  end


# GET /applicants_by_job/1
  def showByJobID
   @jobs=JobApplicant.where(job_id: params[:id])
   authorize! :show, @jobs
    render json: @jobs
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
