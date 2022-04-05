@transfer-data
Feature: Se prueban los diferentes endpoints del MS

  Background:
    * url signBaseUrl


  Scenario: BDSD-19211 - Consulta de Conceptos de Transferencias
    * url transfermanagerUrl
    Given path 'transfers/v1/data/concepts'
    And header Content-Type = 'application/json'
    When method GET
    Then status 200
    And match response[0].label == 'Alquileres'
    And match response[0].id == '1'
    And match response[1].label == 'Cuota'
    And match response[1].id == '2'
    And match response[2].label == 'Expensas'
    And match response[2].id == '3'
    And match response[3].label == 'Factura'
    And match response[3].id == '4'
    And match response[4].label == 'Prestamos'
    And match response[4].id == '5'
    And match response[5].label == 'Seguro'
    And match response[5].id == '6'
    And match response[6].label == 'Honorarios'
    And match response[6].id == '7'
    And match response[7].label == 'Varios'
    And match response[7].id == '8'
    And match response[8].label == 'Haberes'
    And match response[8].id == '9'
    And match response[9].label == 'Operaciones Inmobiliarias'
    And match response[9].id == 'A'
    And match response[10].label == 'OP. Inmobiliarias habituales'
    And match response[10].id == 'B'
    And match response[11].label == 'Bienes registrables habituales'
    And match response[11].id == 'C'
    And match response[12].label == 'Bienes registrables no habituales'
    And match response[12].id == 'D'
    And match response[13].label == 'Suscripción obligaciones negociables'
    And match response[13].id == 'E'
    And match response[14].label == 'Reintegro obras sociales y prepagas'
    And match response[14].id == 'F'
    And match response[15].label == 'Siniestro de seguros'
    And match response[15].id == 'G'
    And match response[16].label == 'Aportes de capital'
    And match response[16].id == 'H'
    And match response[17].label == 'Estado expropiaciones u otros'
    And match response[17].id == 'I'



  Scenario: BDSD-19211 - Consulta de Titularidad CBU de otro Banco

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
    * url transfermanagerUrl
    And path 'transfers/v1/data/accountHolder'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    And request
    """
    {
      "accountNumber": "0996752789",
      "accountType": "CC",
      "currency": "ARS",
      "destinationCbu": "0170099220000067527899"
    }
    """
    When method POST
    Then status 200
    And match response.accountHolder == ["TIA GABY"]
    And match response.bank == 'BBVA FRANCES'
    And match response.cbu == '0170099220000067527899'
    And match response.cuits == ["27182992033","27055905059"]
    And match response.accountNumber == '0996752790'
    And match response.currency == 'ARS'


  Scenario: BDSD-19211 - Consulta de Titularidad CBU Cuenta BDS

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
    * url transfermanagerUrl
    And path 'transfers/v1/data/accountHolder'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    And request
    """
    {
      "accountNumber": "1200000052",
      "accountType": "CC",
      "currency": "ARS",
      "destinationCbu": "3108100900012000000522"
    }
    """
    When method POST
    Then status 200
    And match response.accountHolder == ["JUAN CLAUDIO ORTEGA COR"]
    And match response.bank == 'BANCO DEL SOL'
    And match response.cbu == '3108100900012000000522'
    And match response.cuits == ["20310084663"]
    And match response.accountNumber == '1200000052'
    And match response.currency == 'ARS'

  Scenario: BDSD-19211 - Consulta de Titularidad CVU

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
    * url transfermanagerUrl
    And path 'transfers/v1/data/accountHolder'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    And request
    """
    {
      "accountNumber": "1200000052",
      "accountType": "CC",
      "currency": "ARS",
      "destinationCbu": "0000003100082380741030"
    }
    """
    When method POST
    Then status 200
    And match response.accountHolder == ["LEANDRO ALESSANDRELLO"]
    And match response.bank == 'MERCADO PAGO'
    And match response.cbu == '0000003100082380741030'
    And match response.cuits == ["20308824250"]
    And match response.accountType == 'CV'
    And match response.bankId == 'MP'
    And match response.currency == 'ARS'

  Scenario: BDSD-19211 - Consulta de Titularidad Token null
#Bug reportado https://gss-bdsol.atlassian.net/browse/BDSD-20591
    * url transfermanagerUrl
    Given path 'transfers/v1/data/accountHolder'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer '
    And request
    """
    {
      "accountNumber": "1200000052",
      "accountType": "CC",
      "currency": "ARS",
      "destinationCbu": "3108100900012000000522"
    }
    """
    When method POST
    Then status 401




