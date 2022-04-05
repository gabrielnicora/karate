@int @regression @regression_yellow
Feature: BDSD-17689 - Consulta masiva de estado de leads

  Background:
    * url scoringBaseUrl

  Scenario: BDSD-18339 - Validar que al hacer la consulta masiva, devuelve los datos de los usuarios consultados, si es customer o lead y si está vivo
    Given path 'leads'
    And def body =
    """
    [
        {
            "documentNumber": 38618175,
            "gender": "F"
        },
        {
            "documentNumber": "38618176",
            "gender": "F"
        }
    ]
    """
    When request body
    And method post
    And status 201
    Then match $[0].isAlive == '#present' || $[0].isAlive == false || $[0].isAlive == true
    And match $[0].customer == '#present' || $[0].customer == false || $[0].customer == '#notpresent'

  Scenario: BDSD-18340 - Validar que al hacer la consulta masiva, si los DNI no existen devuelve un status code 404
    Given path 'leads'
    And def body =
    """
    [
        {
            "documentNumber": 90909090,
            "gender": "F"
        },
        {
            "documentNumber": "90909091",
            "gender": "F"
        }
    ]
    """
    When request body
    And method post
    And status 404
    Then match $.message contains 'Persons not found'