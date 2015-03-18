Here is an explanation for each answer and why I chose to solve it in that way : 


### Asynchronous updates

For this feature I chose to do long polling using Jquery. I could have used the entangled gem that uses redis, but it requires rails 4, and I didn't want to upgrade to rails 4 because one of the prerequisites is that the app should rn on rails 3.2. Now the users' statuses update every 10 seconds. To test this feature you would need to deploy the app to heroku and 2 users need to log in and try the feature. Testing it from localhost will not show any updates because you will be current_user which is not included in the @user variable that I am polling for, and there is no need to poll for current_user changes anyways, just other users. 

### Teams

I created a simple scaffold for the teams which has the CRUD functionality. I added two new actions 'join' and 'unjoin' so that every user can choose to join a team so that his/her status will appear on that team's show page. 

### Tests

I got 89.1 coverage. I mainly depended on functional and integration tests with capybara. 

### Migration for IP addresses

For this I wrote a sql query that will work on postgres or mysql but not sqlite because sqlite does not support 'alter' command. So my answer for this questions is commented for you to look at it but the migration won't take effect, however the solution definitely works on a production environment when we are using mysql or postgres.

## Additional Questions to Answer

Please include your answers in a text file with the project.

1. Notice that, in the finished project, the IP addresses are stored as
integers in the DB. What are the pros and cons of this approach, compared
to storing the IP addresses as strings?

2. Are there any security issues present in the app itself? (No need to
mention security vulnerabilities within external gems.) List any security
issues you found, and how to fix them. Also list any potential security
issues that you investigated which you believe the site to be free of.

I have found two main security issues :
1- applicationController does not have protect_from_frogery which could lead to serious Cross-Site Request Forgery. Solution is just to add protect_from_frogery. 

2- you are including config/initializers/secret_token.rb in source version control so it's public. Solution is to use a gem like Figaro to hide environment variables. 

3- I investigated SQL injection but the app is from free from that because all data from user input is interpolated. 

4- I investigated wether I can edit someone else's status by visiting the edit url, but that wont work because you are using a filter. 

Thanks
