@int @regression @regression_yellow
Feature: BDSD-17688 - Consulta de estado de lead/customer

  Background:
    * url scoringBaseUrl

  Scenario: BDSD-18336 - Validar que al consultar el dni devuelve si es customer o lead y si está vivo
    Given path 'leads', 'validations', '38618175', 'F'
    And method get
    And status 200
    Then match $.isAlive == '#present' || $.isAlive == false || $.isAlive == true
    And match $.customer == '#present' || $.customer == false || $.customer == '#notpresent'


  Scenario: BDSD-18337 - Validar que al consultar un dni no existente en BD, devuelve un statusCode 404
    Given path 'leads', 'validations', '90909090', 'F'
    And method get
    And status 404
    Then match $.message contains 'Person not found'