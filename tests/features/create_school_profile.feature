Feature: Create school profiles related to a school
        As a Logistics Coordinator
        In order to manage school data
        I want to create a new school profile and relate it to an existing school taxonomy term.

        Scenario: Create a School Profile and relate it to a School taxonomy term
                Given I am logged in as a user with the "Logistics Coordinator" role
                # QUESTION: What are the essential fields for schools?
                # This can probably be an alias for
                # Given "School" terms:
                And the following schools exist:
                        | name                       |
                        | Cass Technical High School |
                When I am at "node/add/school-profile"
                And I fill in "Cass Technical High School" for "School Name"
                And I check "9"
                And I check "10"
                And I check "11"
                And I check "12"
                And I enter "Paulo" for "School Contact First Name"
                And I enter "Freire" for "School Contact Last Name"
                # In-school programs
                And I enter "Go Green Challenge" for "#edit-field-in-school-programs-und-0-value"
                # There are multiple "Add another item" buttons on the page
                # so we have to use the ID
                And I press the "#edit-field-in-school-programs-und-add-more" button
                And I enter "Robotics" for "#edit-field-in-school-programs-und-1-value"
                And I press the "#edit-field-in-school-programs-und-add-more" button
                And I enter "STEM Genius Engineering" for "#edit-field-in-school-programs-und-1-value"
                # AP Classes
                And I check "Art History"
                And I check "Biology"
                And I check "Calculus AB"
                And I check "Calculus BC"
                And I select the radio button "After School Transportation" with the id "edit-field-after-school-transportatio-und-1"
                # Dual enrollment defaults to "No", test for this later

                # QUESTION: What are the essential fields for a school profile?
                # There are a lot of fields that we could put
                # data in, but this might get kind of slow
                And I select "Cass Technical High School" for "School"
                And I press the "Save" button
                Then "School Profile Cass Technical High School has been created." is present
                Then the header "Cass Technical High School" is present
                Then "Go Green Challenge" is present
                Then "Robotics" is present
                Then "STEM Genius Engineering" is present
                # TODO: Check for value of After school transportation and
                # Dual enrollment
                # We probably need to define reigons to do this
                # TODO: Check for association with school taxonomy term
                # by presence of address
