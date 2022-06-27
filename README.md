# Job_Board_API 



## Project Description

The Job Board API will be used by your Users (Job Seekers) to perform the following tasks:

- List Job Posts
- Apply to Jobs

Every User (Job Seeker) will have their own job applications that have statuses that can be checked (seen, not seen). Job Posts are managed by other Users (Admin).

The Job Board app will be used by your Admin User to perform the following tasks:

- Manage A Job Post
- List Job Applications
- List Job Posts


[more details ](ruby_task.md)


## endpoints

### auth endpoints 

+ POST  `/signup`     ==> create an account  you should provide the user data in this format

```
{
   "user":{
       "email":"ash@gmail.com",
    "password":"@Ash12345"
}
}
```
user.is_admin is set to `false` by default 


+ POST `/login`     ===> login if authenticatd and obtain the JWT token in the headers



+  GET  `/current_user`   ==> get the data of current logged in user 

    you should provide the JWT TOKEN in the header of this request 



+ DELETE  `/logout`   ==> end user session 


   you should provide the JWT TOKEN in the header of this request 


### Job Posting endpoints (all require jwt token )


+ POST  `/jobs`    ===> create a new job   you should  provide the body in this format and
 the `user.is_admin` should be  `true`

    ```
    {
    "title": "sddsad",
    "description": "nusadllsdasd"
     }
    ```

+ Get `/jobs`   ===> to view all the jobs 


+ Get `/jobs/:id`    ==> to view a job by id   


+ PUT `/jobs/:id`    ==> to EDIT  a job by id  partial/full update the `user.is_admin` should be  `true`

  
    ```
        {
        "title": "sddsad",
        "description": "nusadllsdasd"
        }
    ```
  
+ DELETE   `/jobs/:id`    ==> to remove a job   the `user.is_admin` should be  `true`



### Job applicants endpoints (all require jwt token )


+ POST   `/job_applicants`   ==>  apply for a specific job you should add the required job id in the body

    ```
        {
        "job_id": 1
        }
    ```


+ GET `/job_applicants`   ==>  show all job applications  the `user.is_admin` should be  `true`



+ GET `/job_applicants/:id`   ==> show speseific job application the `user.is_admin` should be  `true`

    this will set the application status to `seen`


+ GET `applicants_by_job/:job_id`   ==> this will show all the applications for a specific job  
                                        the `user.is_admin` should be  `true`


+ PUT   `job_applicants/:id`       ==> update job application user how created the job application **only**     can edit it     send with the body the new job id you want to apply for 

    ```
    {
    "job_id": intger
     }
    ```

+ DELETE  `job_applicants/:id`    ==> DELETE job application user how created the job application   **only** can remove it    