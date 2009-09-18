Feature: User authentication
  In order to access the site
	As a user
  I must register and log in

  Scenario: Register as new user
		Given I am on the homepage
		When I follow "Sign up!"
		Then I should be on the signup page
		When I fill in the following:
			| username | subscriber |
			| email    | subscriber@example.com |
			| password | secret |
			| confirm password | secret |
		And I press "Sign up"
		Then I should be on the homepage
		And I should see "Thank you for signing up! You are now logged in."
  
  Scenario: Edit profile
		Given a user is logged in as "subscriber"
		And I am on the homepage
		When I follow "My profile"
		Then I should see "Show User Profile"
		When I follow "Edit Profile"
		Then I should see "Edit User Profile"
		When I fill in "email" with "changed@example.com"
		And I press "Submit"
		Then I should be on the homepage
		And I should see "Successfully updated user profile."
  