Feature: To send feedback using feedback form
        As a School Leader, using any page of the Portal site
        In order to send feedback to ESD
        I want to fill out and submit the feedback form
        
  Scenario: Fill out and submit feedback form
        Given I am logged in as a user with the "School Leader" role
        When I am on the homepage
        When I fill in "comments" with "test feedback" 
        And I press the "submit" button
        Then I should be on the homepage 
        And I should see text matching "Thank you for providing feedback."

  Scenario: Submit incomplete feedback form
  
