Feature: Create a school representative
        As a Logistics Coordinator
        In order to manage school data
        # School Representatives are school employees who can edit some data about
        # their school (the "school profile")
        I need to create a School Representative user

        # TODO: Scenario for navigating to the create new user view
        # The flow through the UI seems a bit in flux right now and to me
        # it seems like this is a separate test case from the user creation

        Scenario: Create a School Representative user and assign them to a school
                Given I am logged in as a user with the "Logistics Coordinator" role
                And the following schools exist:
                        | name                       | bcode | address1     | city    | state | zip   |
                        | Cass Technical High School | 554   | 2501 2nd Ave | Detroit | MI    | 48201 |
                When I am at "/admin/people/create"
                And I fill in "PauloFreire" for "Username"
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
                And I am at "/manage-users"
                And I fill in "Freire" for "Filter by Last Name"
                And I press the "Apply" button
                Then "PauloFreire" is visible
