Feature: Edit a school profile as School Leader
        As a School Leader with a School Profile node f=or which I have write access permissions
        In order to manage my school's profile
        I want to edit the profile
        
  # @todo test for these tabs that Eric added
  # this test would make sure that the tabs work, and also list all of the fields in each tab
  # (that's a lot of fields!)
  # This test would modify fields in both tabs
  Scenario: Save 2014 and 2013 data
  
  # This test would only change the 2014 tab
  Scenario: Add only 2014 data
  
  # Forgot some fields?
  Scenario: Incompletely fill out data
  
# IMHO, this shouldn't be a feature, but an assertion of the test
#Feature: Disallow editing some fields on School Profile from School Leader
#          As a School Leader with a School Profile node for which I have write access permissions
#            In order to manage my school's profile but not mess up the database
#              I should not be able to edit 'field_school'
