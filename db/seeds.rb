# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


admin=User.create(email: 'admin@admin.com' , password: 'admin123', is_admin: true)
user=User.create(email: 'user@user.com' ,password: 'user123')
user2=User.create(email: 'user2@user.com' ,password: 'user123')
user3=User.create(email: 'user3@user.com', password: 'user123')


job=Job.create({title: "Software Engineer", description: "full stack web dev with 3 years of expierence",user_id:1})
job2=Job.create({title: "Back End Dev", description: "I am aBack End Dev dev with 3 years of expierence",user_id:1})
job3=Job.create({title: "Front End Dev ", description: "I am a Front End Devdev with 3 years of expierence",user_id:1})

applicant=JobApplicant.create([{user_id:4, job_id:1}])      
applicant2=JobApplicant.create([{user_id:2, job_id:1}])      
applicant3=JobApplicant.create([{user_id:3, job_id:1}])      
applicant3=JobApplicant.create([{user_id:4, job_id:2}])      
applicant3=JobApplicant.create([{user_id:3, job_id:2}])      
applicant3=JobApplicant.create([{user_id:2, job_id:3}])      
applicant3=JobApplicant.create([{user_id:3, job_id:3}])      

