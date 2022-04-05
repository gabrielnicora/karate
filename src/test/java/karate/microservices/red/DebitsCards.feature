@debit-cards-manager
Feature: Se realiza el alta, activación, reimpresión y eliminación de una tarjeta

  Background:
    * url signBaseUrl

  Scenario: BDSD-19935 - Alta, Activacion, pausa, reactivacion y Baja de una tarjeta de debito con Token Ok

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
      "email":   "bdsolqea482c9b@gmail.com",
      "appBundleId": "ar.com.bdsol.bds.squads.int"
    }
    """
    When method post
    Then status 200
    #Alta
    * def actionToken = response.actionToken
    * url debitscardsUrl
    And path 'debit-cards/manager/v1/physical'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + actionToken
     * def body =
  """
  {
    "address_id": "6940"
  }
  """
    And request body
    When method POST
    Then status 200
    #Activar
   * def numberCard = response.cardNumber
    And path 'debit-cards/manager/v1/physical/' + numberCard + '/activate'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + actionToken
    When method POST
    Then status 200
    #Pausar
   And path 'debit-cards/manager/v1/cards/' + numberCard
   And header Content-Type = 'application/json'
   And header Authorization = 'Bearer ' + actionToken
    * def body =
     """
     {
       "paused":"true"
     }
     """
    And request body
    When method PATCH
   Then status 200
    #Reactivar
    And path 'debit-cards/manager/v1/cards/' + numberCard
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + actionToken
    * def body =
     """
     {
       "paused":"false"
     }
     """
    And request body
    When method PATCH
    Then status 200
    #Eliminar
    And path 'debit-cards/manager/v1/physical/' + numberCard
   And header Content-Type = 'application/json'
   And header Authorization = 'Bearer ' + actionToken
   When method DELETE
   Then status 200



 Scenario: BDSD-19935 - Baja de una tarjeta de debito con Token Erroneo
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
      "email":   "bdsolqea482c9b@gmail.com",
      "appBundleId": "ar.com.bdsol.bds.squads.int"
    }
    """
   When method post
   Then status 200
   * def actionToken = response.actionToken
   * url debitscardsUrl
  And path 'debit-cards/manager/v1/physical/' + '4549700001189948'
  And header Content-Type = 'application/json'
  And header Authorization = 'Bearer ' + actionToken
  When method DELETE
  Then status 401

  Scenario: BDSD-19935 - Activacion de una tarjeta de debito con Token Erroneo
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
      "email":   "bdsolqea482c9b@gmail.com",
      "appBundleId": "ar.com.bdsol.bds.squads.int"
    }
    """
    When method post
    Then status 200
    * def actionToken = response.actionToken
    * url debitscardsUrl
    And path 'debit-cards/manager/v1/physical/' + '4549700001189690' + '/activate'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + actionToken
    When method POST
    Then status 401

  Scenario: BDSD-19935 - Pausar de una tarjeta de debito con Token Erroneo
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
      "email":   "bdsolqea482c9b@gmail.com",
      "appBundleId": "ar.com.bdsol.bds.squads.int"
    }
    """
    When method post
    Then status 200
    * def actionToken = response.actionToken
    * url debitscardsUrl
    And path 'debit-cards/manager/v1/cards/' + '4549700001189690'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + actionToken
    * def body =
     """
     {
       "paused":"true"
     }
     """
    And request body
    When method PATCH
    Then status 401

  Scenario: BDSD-19935 - Reactivar de una tarjeta de debito con Token Erroneo
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
      "email":   "bdsolqea482c9b@gmail.com",
      "appBundleId": "ar.com.bdsol.bds.squads.int"
    }
    """
    When method post
    Then status 200
    * def actionToken = response.actionToken
    * url debitscardsUrl
    And path 'debit-cards/manager/v1/cards/' + '4549700001189690'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + actionToken
    * def body =
     """
     {
       "paused":"false"
     }
     """
    And request body
    When method PATCH
    Then status 401

  Scenario: BDSD-19935 - Reimprimir de una tarjeta de debito con Token Erroneo
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
      "email":   "bdsolqea482c9b@gmail.com",
      "appBundleId": "ar.com.bdsol.bds.squads.int"
    }
    """
    When method post
    Then status 200
    * def actionToken = response.actionToken
    * url debitscardsUrl
    And path 'debit-cards/manager/v1/physical/' + '4549700001189690' + '/reprint'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + actionToken
    * def body =
     """
       {
        "addressId": "0"
       }
     """
    And request body
    When method POST
    Then status 401




