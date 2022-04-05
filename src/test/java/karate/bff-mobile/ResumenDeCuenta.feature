 @bff-mobile @resumenDeCuenta
Feature: Obtener respuesta exitosa del endpoint resumen de cuenta.

  Background:
    * url bffmobileBaseUrl

  Scenario: Obtenego movimientos de mi cuenta desde el BFF con mi JWT
    Given path 'api/auth/link-account-token'
    And header Content-Type = 'application/json'
    And header bds-device = '44444'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
  "deviceId": "44444",
  "email": "hmateikabdsolqe@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.multicolor"
}
    """
    When method post
    Then status 201
    * def actionToken = response.actionToken
    And path 'api/auth/link-account'
    And header Content-Type = 'application/json'
    And header bds-device = '44444'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
  "passcode": "192837",
  "actionToken": "#(actionToken)",
  "device": {
    "uid": "44444",
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
    And header bds-device = '44444'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
    "offlineToken": "#(offlineToken)",
    "passcode": "192837",
    "email": "hmateikabdsolqe@gmail.com",
    "deviceId": "44444"
}
    """
    When method post
    Then status 201
    * def accessToken = response.accessToken
    And path 'api/me/accounts/1000000078/summary/\?fromDate=2022-01-01&toDate=2022-01-31'
    And header Authorization = "Bearer " + accessToken
    When method get
    Then status 200

    Scenario: Intento no exitoso de obtener movimientos de otra cuenta usando otro JWT activo
    Given path 'api/auth/link-account-token'
    And header Content-Type = 'application/json'
    And header bds-device = '55555'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
  "deviceId": "55555",
  "email": "bdsolqe134a0fc@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.multicolor"
}
    """
    When method post
    Then status 201
    * def actionToken = response.actionToken
    And path 'api/auth/link-account'
    And header Content-Type = 'application/json'
    And header bds-device = '55555'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
  "passcode": "192837",
  "actionToken": "#(actionToken)",
  "device": {
    "uid": "55555",
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
    And header bds-device = '55555'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request 
    """
{
    "offlineToken": "#(offlineToken)",
    "passcode": "192837",
    "email": "bdsolqe134a0fc@gmail.com",
    "deviceId": "55555"
}
    """
    When method post
    Then status 201
    * def accessToken = response.accessToken
    And path 'api/me/accounts/1200000036/summary/\?fromDate=2022-01-01&toDate=2022-01-31'
    And header Authorization = "Bearer " + accessToken
    When method get
    Then status 404