Feature: Cambio de Estado Préstamo - Current

Background:
    * url bffmobileBaseUrl
    Given path 'api', 'auth', 'link-account-token'
    And request
    """
    {
        "deviceId"    :"a6d69105f7f4b10d",
        "email"       :"bdsolqeyellow@gmail.com",
        "appBundleId" :"ar.com.bdsol.bds.int"
    }
    """
    And method post
    * def token = response.actionToken
    * url loansBaseUrl

Scenario:  BDSD-16532 - Al crearse una simulación esta es procesada por el CORE y pasada automáticamente al estado Current (Karate)
    * def solicitarSimulacion = call read('BDSD-15925-solicitarSimulacion.feature@solicitarSimulacion')	
    Given path 'simulations'
    And header Authorization = 'Bearer ' + token
    And header bds-channel = 'mobile'
    When method get
    Then status 200
    * def last = solicitarSimulacion.last
    And match last.status == 'CURRENT'

Scenario:  BDSD-16533 - Para un usuario que posee una simulación en estado Current se le crea una nueva y ésta pasa a OVERDUE (Karate)
    * def solicitarSimulacion = call read('BDSD-15925-solicitarSimulacion.feature@solicitarSimulacion')	
    Given path 'simulations'
    And header Authorization = 'Bearer ' + token
    And header bds-channel = 'mobile'
    When method get
    Then status 200
    * def last = solicitarSimulacion.last
    And match last.status == 'CURRENT'
    * def simulationID = last._id
    * def solicitarSimulacion = call read('BDSD-15925-solicitarSimulacion.feature@solicitarSimulacion')	
    When path 'simulations', simulationID
    And header Authorization = 'Bearer ' + token
    And method get
    Then status 200
    And match response.status == 'OVERDUE' || response.status == 'CURRENT'

Scenario: BDSD-16534 - Se intenta cambiar el estado de una simulación de Current a In progress y sistema devuelve un error (Karate)
    * def solicitarSimulacion = call read('BDSD-15925-solicitarSimulacion.feature@solicitarSimulacion')	
    Given path 'simulations'
    And header Authorization = 'Bearer ' + token
    And header bds-channel = 'mobile'
    When method get
    Then status 200
    * def last = solicitarSimulacion.last
    And match last.status == 'CURRENT'
    * def simulationID = last._id
    When path 'simulations', simulationID
    And request
    """
    {
        "status": "IN_PROGRESS"
    }
    """
    And method patch
    Then status 400