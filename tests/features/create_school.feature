@api
Feature: Create a school
        # Logistics Coordinators are on ESD staff
        # they manage school data and help school leaders and superintendents
        # use the portal
        As a Logistics Coordinator
        In order to manage school data
        I want to create a new school taxonomy term.

        Scenario: Create a new school as a Logistics Coordinator
                Given I am logged in as a user with the "Logistics Coordinator" role
                # TODO: Navigation to the school adding view, but
                # there doesn't seem to be an easy flow right now
                And I am at "admin/structure/taxonomy/schools/add"
                When I fill in "Cass Technical High School" for "Name"
                And I select "HS" from "School type"
                And I select "Mature" from "School Scorecard status"
                And I select "Open" from "School status"
                And I fill in "554" for "Building code"
                And I fill in "2501 2nd Ave" for "Address 1"
                # These are the defaults:
                #And I fill in "Detroit" for "City"
                #And I select "Michigan" from "State"
                And I fill in "48201" for "ZIP Code"
                And I fill in "313-263-2000" for "Contact Phone"
                # There are no values available in these drop-downs following
                # a vanilla install script
                #And I fill in "Open-Active" for "State status"
                #And I select "DPS" from "Governance"
                #And I check "10"
                #And I check "11"
                #And I check "12"
                #And I check "9"
                #And I select "Detroit City School District" for "District"
                And I check "Opted in?"
                And I check "5E roster"
                And I fill in "1/14/2013" for "2013 site visit date"
                And I check "grDataLetter"
                And I check "Scorecard Display"
                And I press the "Save" button
                # There is a confirmation message shown, but we should
                # do this check which reflects user experience vetter
                And I am at "/manage-schools"
                And I fill in "Cass Technical High School" for "Filter by School Name"
                And I press the "Apply" button
                And I click "Cass Technical High School"
                Then I should see the heading "Cass Technical High School" 
                Then I should see "Building code:"
                Then I should see "554"
                Then I should see "Address:"
                Then I should see "2501 2nd Ave"
                Then I should see "Detroit, MI 48201"
