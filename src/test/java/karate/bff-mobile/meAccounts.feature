@meAccount @bff-mobile
Feature: Obtener respuesta exitosa del endpoint meaccount

  Background:
    * url bffmobileIntegration

  Scenario: Validar el CBU y numero de cuenta de cliente existente
    Given path 'api/auth/link-account-token'
    And header Content-Type = 'application/json'
    And header bds-device = '33333'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
  "deviceId": "33333",
  "email": "bdsolqe0fd71c2@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.multicolor"
}
    """
    When method post
    Then status 201
    * def actionToken = response.actionToken
    And path 'api/auth/link-account'
    And header Content-Type = 'application/json'
    And header bds-device = '33333'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
  "passcode": "192837",
  "actionToken": "#(actionToken)",
  "device": {
    "uid": "33333",
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
    And header bds-device = '33333'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
    "offlineToken": "#(offlineToken)",
    "passcode": "192837",
    "email": "bdsolqe0fd71c2@gmail.com",
    "deviceId": "33333"
}
    """
    When method post
    Then status 201
    * def accessToken = response.accessToken
    And path 'api/me/accounts'
    And header Authorization = "Bearer " + accessToken
    And header bds-device = '33333'
    And header bds-ip = '10.224.0.229'
    And header Content-Type = 'application/json'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    #And header bds-client = 8791
    When method get
    Then status 200
    And match response[0].accountNumber == 1200001199
    And match response[0].cbu == "3108100900012000011991"