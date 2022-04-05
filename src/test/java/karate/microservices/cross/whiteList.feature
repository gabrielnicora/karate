@int @regression @regression_cyan
Feature: whiteList

  Background:
    * url togglesFeatureBaseUrl


  Scenario: Create feature
    Given path '/v1/features/'
    * def featureName = randomFeatureWhiteListName
    And request
    """
    {
        "name": '#(featureName)'
    }
    """
    When method post
    Then status 200
    Then match response.name == featureName
    Then match response.blacklist == '#array'
    Then match response.whitelist == '#present'
    Then match response.enabled == '#boolean'

    When path '/v1/features/' + featureName
    When method delete
    Then status 204

  Scenario: Delete feature
    Given path '/v1/features/'
    * def featureName = randomFeatureWhiteListName
    And request
    """
    {
        "name": '#(featureName)'
    }
    """
    When method post
    Then status 200
    When path '/v1/features/' + featureName
    When method delete
    Then status 204

    When path '/v1/features/' + featureName
    When method get
    Then status 404
    Then match response.path == '/v1/features/' + featureName
    Then match response.timestamp == '#present'
    Then match response.description == '#present'

  Scenario: Get features - Name
    Given path '/v1/features/KARATE-TEST'
    When method get
    Then status 200
    Then match response.name == "KARATE-TEST"
    Then match response.blacklist[0] == 667
    Then match response.whitelist[0] == 666
    Then match response.enabled == true

  Scenario: Add person to whitelist - check user - Delete from whitelist
    Given path '/v1/features/skip_biometric_auth/whitelist'
    And request
    """
    {
        "personIds": [666]
    }
    """
    When method post
    Then status 200
    Then match response.name == "skip_biometric_auth"
    Then match response.blacklist == '#array'
    Then match response.whitelist == '#present'
    Then match response.enabled == '#boolean'

    When path '/v1/features/skip_biometric_auth/whitelist/666'
    When method get
    Then status 200
    When path '/v1/features/skip_biometric_auth/whitelist'
    And request
    """
    {
        "personIds": [666]
    }
    """
    When method delete
    Then status 200

  Scenario: Add person to blacklist - Check - Remove person to blacklist
    Given path '/v1/features/skip_biometric_auth/blacklist'
    And request
    """
    {
        "personIds": [15026]
    }
    """
    When method post
    Then status 200
    Then match response.name == "skip_biometric_auth"
    Then match response.blacklist == '#array'
    Then match response.whitelist == '#present'
    Then match response.enabled == '#boolean'

    When path '/v1/features/skip_biometric_auth'
    When method get
    Then status 200
    Then match response.name == "skip_biometric_auth"
    Then match response.blacklist[0] == 15026
    Then match response.enabled == true

    When path '/v1/features/skip_biometric_auth/blacklist'
    And request
    """
    {
        "personIds": [15026]
    }
    """
    When method delete
    Then status 200

    When path '/v1/features/skip_biometric_auth'
    When method get
    Then status 200
    Then match response.name == "skip_biometric_auth"
    Then match response.blacklist[0] == 667
    Then match response.enabled == true



  Scenario: Enabled/Disabled - feature
    Given path '/v1/features/KARATE-TEST-ENABLED-DISABLED/enabled'
    And request
    """
    {
        "enabled": false
    }
    """
    When method put
    Then status 200
    Then match response.name == "KARATE-TEST-ENABLED-DISABLED"
    Then match response.blacklist == '#array'
    Then match response.whitelist == '#present'
    Then match response.enabled == false

    When path '/v1/features/KARATE-TEST-ENABLED-DISABLED/enabled'
    And request
    """
    {
        "enabled": true
    }
    """
    When method put
    Then status 200
    Then match response.name == "KARATE-TEST-ENABLED-DISABLED"
    Then match response.blacklist == '#array'
    Then match response.whitelist == '#present'
    Then match response.enabled == true
