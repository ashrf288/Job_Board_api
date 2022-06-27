require "test_helper"

class JobApplicantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_applicant = job_applicants(:one)
  end

  test "should get index" do
    get job_applicants_url, as: :json
    assert_response :success
  end

  test "should create job_applicant" do
    assert_difference("JobApplicant.count") do
      post job_applicants_url, params: { job_applicant: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show job_applicant" do
    get job_applicant_url(@job_applicant), as: :json
    assert_response :success
  end

  test "should update job_applicant" do
    patch job_applicant_url(@job_applicant), params: { job_applicant: {  } }, as: :json
    assert_response :success
  end

  test "should destroy job_applicant" do
    assert_difference("JobApplicant.count", -1) do
      delete job_applicant_url(@job_applicant), as: :json
    end

    assert_response :no_content
  end
end
