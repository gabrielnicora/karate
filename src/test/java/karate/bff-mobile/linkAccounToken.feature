@bff-mobile @linkAccountToken
Feature: Obtener action token api/auth/link-account-token

  Background:
    * url bffmobileIntegration

  Scenario: Obtener ActionToken
    Given path 'api/auth/link-account-token'
    And header Content-Type = 'application/json'
    And header bds-device = '121212'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
    {
     "deviceId": "121212",
     "email": "bdsolqe1b0f4cb@gmail.com",
     "appBundleId": "ar.com.bdsol.bds.squads.multicolor"
    }
    """
    When method post
    Then status 201    