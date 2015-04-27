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
  Scenario: Request a school based on its ESD id (/schools/1243) and make sure it has certain fields
  Given "Schools" content: 
    | name      | field_school_type | field_bcode | field_scorecard_display | field_governance  | field_district                | field_5e_roster | field_2014_site_visit_date | field_2015_5essentials_roster  | field_2015_profile  |
    | XYZ High  | K12               | 7890        | 1                       | DPS               | Detroit City School District  | 0               | 1/15/2014                  | 1                              | 1                   |
    When I send a GET request to "schools/1234"
    Then the response should contain json:  
    """
    {
      "name": {
       "": [
           {
              "name": "XYZ High"
            }
        ]
      },
      "field_school_type": {
        "": [
            {
              "name": "K12",
              "tid": "922"
            }
        ],
        "und": [
            {
              "tid":"922"
            }
        ]
      },
      "field_bcode": {
        "und": [
            {
              "value": "7890"
            }
        ]
      },
      "field_scorecard_display": {
        "und": [
            {
              "value": "1"
            }
        ]
      },
      "field_governance": {
        "": [
            {
              "name": "DPS",
              "tid": "905"
            }
        ],
        "und": [
            {
              "tid":"905"
            }
        ]
      },
      "field_district": {
        "": [
            {
              "name": "Detroit City School District",
              "tid": "953"
            }
        ],
        "und": [
            {
              "tid":"953"
            }
        ]
      },
      "field_5e_roster": {
        "und": [
            {
              "value": "0"
            }
        ]
      },
      "field_2014_site_visit_date": {
        "und": [
            {
              "date_time": "datetime",
              "timezone": "America/Detroit",
              "timezone_db": "America/Detroit",
              "value": "2014-01-15 00:00:00"
            }
        ]
      },
      "field_2015_5essentials_roster": {
        "und": [
            {
              "value": "1"
            }
        ]
      },
      "field_2015_profile": {
        "und": [
            {
              "value": "1"
            }
        ]
      }
      """
  
  @api
  Scenario: 
    
    
    
