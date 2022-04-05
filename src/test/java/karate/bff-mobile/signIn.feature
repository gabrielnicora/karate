@people-hub
Feature: Obtener access Token api/auth/signIn

  Background:
    * url bffmobileIntegration

  Scenario: Obtener access Token
    Given path 'api/auth/link-account-token'
    And header Content-Type = 'application/json'
    And header bds-device = '66666'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
  "deviceId": "66666",
  "email": "bdsolqe0fd71c2@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.multicolor"
}
    """
    When method post
    Then status 201
    * def actionToken = response.actionToken
    And path 'api/auth/link-account'
    And header Content-Type = 'application/json'
    And header bds-device = '66666'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
  "passcode": "192837",
  "actionToken": "#(actionToken)",
  "device": {
    "uid": "66666",
    "model": "model",
    "name": "name",
    "ipAddress": "10.224.0.229"
    }
}
    """
    When method post
    Then status 201
    * def offlineToken = response.offlineToken
    And path 'api/auth/sign-in'
    And header Content-Type = 'application/json'
    And header bds-device = '66666'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
    "offlineToken": "#(offlineToken)",
    "passcode": "192837",
    "email": "bdsolqe0fd71c2@gmail.com",
    "deviceId": "66666"
}
    """
    When method post
    Then status 201