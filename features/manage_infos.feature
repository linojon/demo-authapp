Feature: Manage infos
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Login required
    Given I am on the new info page
    Then I should see "You must first log in or sign up before accessing this page"
    And I should see "Log in"
  
  Scenario: Register new info
    Given a user is logged in as "joe"
    And I am on the new info page
    When I fill in "Title" with "title 1"
    And I fill in "Body" with "body 1"
    And I press "Submit"
    Then I should see "title 1"
    And I should see "body 1"

  Scenario: Delete info
    Given a user is logged in as "joe"
    And the following infos:
      |title|body|
      |title 1|body 1|
      |title 2|body 2|
      |title 3|body 3|
      |title 4|body 4|
    When I delete the 3rd info
    Then I should see the following infos:
      |Title|Body|
      |title 1|body 1|
      |title 2|body 2|
      |title 4|body 4|
