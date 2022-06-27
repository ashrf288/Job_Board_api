class AddUserIdAndJobIdToJobApplicants < ActiveRecord::Migration[7.0]
  def change
    add_reference :job_applicants, :user, null: false, foreign_key: true
    add_column :job_applicants,:job_id , :integer , null: false
  end
end
