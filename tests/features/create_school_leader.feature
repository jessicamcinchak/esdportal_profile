Feature: Create a school leader
        As a Logistics Coordinator
        In order to manage school data
        # School Leaders are school employees who can edit some data about
        # their school (the "school profile")
        I need to create a School Leader user and assign them to a certain school

        # TODO: Scenario for navigating to the create new user view
        # The flow through the UI seems a bit in flux right now and to me
        # it seems like this is a separate test case from the user creation

        Scenario: Create a School Leader user and assign them to a school
                Given I am logged in as a user with the "Logistics Coordinator" role
                # QUESTION: What are the essential fields for schools?
                # This can probably be an alias for
                # Given "School" terms:
                And the following schools exist:
                        | name                       |
                        | Cass Technical High School |
                When I am at "/admin/people/create"
                And I fill in "paulo.freire" for "Username"
                # QUESTION: Do we have conventions for mock usernames,
                # passwords, etc.
                And I fill in "paulo.freire@fakeschool.k12.mi.us"
                And I fill in "test_password" for "Password"
                And I fill in "test_password" for "Confirm password"
                # QUESTION: Should this be "School Representative" or "Superintendent"
                And I check "School Representative"
                And I fill in "Paulo" for "First Name"
                And I fill in "Freire" for "Last Name"
                And I press the "Create new account" button
                # This can probably be an alias for
                # Given /^I am viewing (?:a|an) "(?P<vocabulary>[^"]*)" term with the name "(?P<name>[^"]*)"$/
                And I am viewing a school with the name "Cass Technical High School"
                # QUESTION: How do you associate a user with a school? I only
                # see a "Superintendents" field
                # TODO: Finish this once I figure out how to make the user <-> school association
