@transfers-manager
Feature: Se realiza transferencias Externas e Internas con multiples Conceptos

  Background:

    * url signBaseUrl
  Scenario: BDSD-19211 - Transferencia Interna Concepto Alquileres

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "1",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna concepto Cuota

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "2",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Concepto Expensas

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "3",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Concepto Factura

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "4",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Concepto Prestamo

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "5",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Concepto Seguro

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "6",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Concepto Honorarios

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "7",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Concepto Varios

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "8",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Concepto Haberes

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "9",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Concepto Op. Inmobiliarias

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "A",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Concepto Op. Inmobiliarias Habituales

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "B",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Concepto Bienes Registrables Habituales

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "C",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Concepto Bienes Registrables no Habituales

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "D",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Suscripción obligaciones negociables

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "E",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Reintegro obras sociales y prepagas

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "F",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Siniestro de seguros

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "G",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Aportes de capital

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "H",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Interna Estado expropiaciones u otros

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "I",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "3108100900012000000522",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Concepto Alquileres

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "1",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa concepto Cuota

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "2",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Concepto Expensas

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "3",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Concepto Factura

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "4",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Concepto Prestamo

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "5",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Concepto Seguro

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
   """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "6",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Concepto Honorarios

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
   """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "7",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Concepto Varios

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
   """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "8",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Concepto Haberes

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "9",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Concepto Op. Inmobiliarias

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
   """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "A",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Concepto Op. Inmobiliarias Habituales

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
   """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "B",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Concepto Bienes Registrables Habituales

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "C",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Concepto Bienes Registrables no Habituales

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
   """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "D",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Suscripción obligaciones negociables

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "E",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Reintegro obras sociales y prepagas

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
   """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "F",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Siniestro de seguros

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
   """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "G",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Aportes de capital

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "H",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Estado expropiaciones u otros

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "I",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia CVU

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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "I",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0000003100082380741030",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 200

  Scenario: BDSD-19211 - Transferencia Externa Concepto Haberes con Token Incorrecto
#Bug Detectado cargado en el ticket  https://gss-bdsol.atlassian.net/browse/BDSD-20536
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
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url transfermanagerUrl
    And path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "9",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 404

  Scenario: BDSD-19211 - Transferencia Externa Concepto Haberes con Token null
#Bug Detectado cargado en el ticket  https://gss-bdsol.atlassian.net/browse/BDSD-20536

    * url transfermanagerUrl
    Given path 'transfers'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer '
    * def body =
  """
 {
    "amount": "100",
    "cbuSchedule": "false",
    "conceptCode": "9",
    "currency": "ARS",
    "destinationAccount": {
        "accountType": "CC",
        "cbu": "0170099220000067527899",
        "currency": "ARS",
        "number": "1200000052"
    },
    "document": "20400937762",
    "originAccount": {
        "accountType": "CA",
        "cbu": "3108100900010000059131",
        "currency": "ARS",
        "number": "1000005913"
    }
}
  """
    And request body
    When method POST
    Then status 401