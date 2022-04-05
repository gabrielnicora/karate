@accounts-transactions
Feature: Se realiza el chequeo de movimientos generados en una cuenta

  Background:

    * url signBaseUrl

  Scenario: BDSD-20318 - Movimientos de Cash In RapiPago-PagoFacil con token ok

    Given path 'v1/link-account-token'
    And header Content-Type = 'application/json'
    And header bds-device = '12345'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request
    """
{
  "deviceId": "12345",
  "email": "bdsolqe9b12f12@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url accountTransactionsUrl
    And path '/accounts/1000006479/transactions?count=20'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    When method GET
    Then status 200
    And match response.transactions[1].idProveedor == 'RAPIPAGO'
    And match response.transactions[1].idApp == 'CASH_IN'
    And match response.transactions[2].idProveedor == 'PAGOFACIL'
    And match response.transactions[2].idApp == 'CASH_IN_PAGOFACIL'


  Scenario: BDSD-20318 - Movimientos de Cash In RapiPago-Pagofacil con token Erroneo

    Given path 'v1/link-account-token'
    And header Content-Type = 'application/json'
    And header bds-device = '12345'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request
    """
{
  "deviceId": "12345",
  "email": "bdsolqe884f27e@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url accountTransactionsUrl
    And path '/accounts/1000006479/transactions?count=20'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    When method GET
    Then status 404

