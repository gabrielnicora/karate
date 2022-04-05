Feature: Obtener el token para utilizar los servicios de Sancor Seguros

Background:
    * url insuranceBaseUrl

Scenario:  BDSD-17219 - Obtener un token desde el servicio
    Given path 'insurance-token-manager/v1/token'
    And method get
    And status 200
    Then match response.Token == '#present'
    And match response.Token == '#notnull'
