@bff-mobile @linkAccount
Feature: Obtener offline token api/auth/link-account

  Background:
    * url bffmobileIntegration

  Scenario: Obtener offline Token
    Given path 'api/auth/link-account-token'
    And header Content-Type = 'application/json'
    And header bds-device = '212121'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
  "deviceId": "212121",
  "email": "bdsolqea2221db@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.multicolor"
}
    """
    When method post
    Then status 201
    * def actionToken = response.actionToken
    And path 'api/auth/link-account'
    And header Content-Type = 'application/json'
    And header bds-device = '212121'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
  "passcode": "192837",
  "actionToken": "#(actionToken)",
  "device": {
    "uid": "212121",
    "model": "model",
    "name": "name",
    "ipAddress": "10.224.0.229"
    }
}
    """
    When method post
    Then status 201
