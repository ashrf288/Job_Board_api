class CreateJobApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applicants do |t|
      t.string :status, default: "Not seen", null: false
      t.timestamps
    end
  end
end
