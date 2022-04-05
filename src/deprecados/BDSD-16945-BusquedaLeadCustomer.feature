@int @regression @regression_yellow
Feature: BDSD-16945 - Búsqueda de información personal de Lead/Customer

  Background:
    * url scoringBaseUrl

  Scenario: BDSD-17733 - Valida que al ingresar todos los datos correctos se crea el Lead/Customer (Karate)
    Given path 'leads'
    And def body =
    """
    {
      "documentType": "DNI",
      "documentNumber": 34970776,
      "cuil": 20349707762,
      "gender": "F",
      "name": "JORGE",
      "lastName": "CAIRONI",
      "birthDate": "17-01-1900",
      "typePerson": "1",
      "nationality": "ARGENTINA",
      "residence": "ARGENTINA",
      "maritalStatus": "SINGLE",
      "pasCode": "1234",
      "email": "test@gmail.com",
      "typePerson": "1"
    }
    """
    When request body
    And method post
    And status 201
    * def dni = $.documentType
    * def document = $.documentNumber
    And path 'leads', dni, document
    And method delete
    Then status 200

  Scenario: BDSD-17734 - Valida que al ingresar un documento que no coincide con el apellido devuelve un statusCode 500 (Karate)
    Given path 'leads'
    And def body =
    """
    {
      "documentType": "DNI",
      "documentNumber": 20202020,
      "cuil": 20202020202,
      "gender": "F",
      "name": "JORGE",
      "lastName": "PEREZ",
      "birthDate": "17-01-1900",
      "typePerson": "1",
      "nationality": "ARGENTINA",
      "residence": "ARGENTINA",
      "maritalStatus": "SINGLE",
      "pasCode": "1234",
      "email": "test@gmail.com"
    }
    """
    When request body
    And method post
    And status 500

  Scenario: BDSD-17735 - Valida que al enviar el body sin ciertos campos devuelve un BadRequest
    Given path 'leads'
    And def body =
    """
    {
      "gender": "F",
      "name": "JORGE",
      "lastName": "CAIRONI",
      "birthDate": "17-01-1900",
      "typePerson": "1",
      "nationality": "TEST",
      "residence": "TEST",
      "maritalStatus": "SINGLE"
    }
    """
    When request body
    And method post
    And status 400