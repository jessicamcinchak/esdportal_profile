Feature: Retrieve school data via the API
  As an API consumer
  I need to be able to retrieve data about schools
  So that I can show them in an app or whatever else

  @api
  Scenario: Search for a school by name
  Given "Schools" content:
    | name           |
    | ABC Elementary |
    When I send a GET request to "schools?filters[name]=ABC Elementary"
    Then the first element in the "name" result should contain attributes:
    """
    {
      "name": "ABC Elementary"
    }
    """
    
  @api
  Scenario: 
