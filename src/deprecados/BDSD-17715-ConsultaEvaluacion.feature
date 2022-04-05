@int @regression @regression_yellow
Feature: BDSD-17431 - Solicitud de evaluación crediticia
         BDSD-17715 - Consulta de evaluación crediticia

  Background:
    * url scoringBaseUrl
    * def Approved = '20415752130'
    * def RejectedBCR = '20129240335'
    * def Error = '20253416549'
    * def ManualReview = '20284303378'
    * def RejectedNOS = '20426582652'
    * def RejectedPOC6 = '20492208265'
    * def RejectedPOC1 = '20137471702'

  Scenario: BDSD-17980 - Valida respuesta de experian Aprobado
    Given path 'offers', 'internal', Approved
    When method get
    Then status 200
    And match $.status == 'APROBADA'

  Scenario: BDSD-17989 - Valida respuesta de experian Rechazada, id y descripción del mensaje devuelto por Experian
    Given path 'offers', 'internal', RejectedBCR
    When method get
    Then status 200
    And match $.status == 'RECHAZADA'
    And match $.messages[0].id == 'BCR01'
    And match $.messages[0].description == 'Evaluacion.Politicas.BCR01'

  Scenario: BDSD-17990 - Valida respuesta de experian Revisión Manual sin msj de Experian
    Given path 'offers', 'internal', ManualReview
    When method get
    Then status 200
    And match $.status == 'REVISION MANUAL'

  Scenario: BDSD-17991 - Valida respuesta de experian Error, id y descripción del mensaje devuelto por Experian
    Given path 'offers', 'internal', Error
    When method get
    Then status 200
    And match $.status == 'ERROR'
    And match $.messages[0].id == '1'
    And match $.messages[0].description == 'Error'

  Scenario: BDSD-17992 - Valida respuesta de experian Rechazada (NOS02), id y descripción del mensaje devuelto por Experian
    Given path 'offers', 'internal', RejectedNOS
    When method get
    Then status 200
    And match $.status == 'RECHAZADA'
    And match $.messages[0].id == 'NOS02'
    And match $.messages[0].description == 'Evaluacion.Politicas.NOS02'

  Scenario: BDSD-17993 - Valida respuesta de experian Rechazada (POC06), id y descripción del mensaje devuelto por Experian
    Given path 'offers', 'internal', RejectedPOC6
    When method get
    Then status 200
    And match $.status == 'RECHAZADA'
    And match $.messages[0].id == 'POC06'
    And match $.messages[0].description == 'Evaluacion.Politicas.POC06'

  Scenario: BDSD-17994 - Valida respuesta de experian Rechazada (POC01), id y descripción del mensaje devuelto por Experian
    Given path 'offers', 'internal', RejectedPOC1
    When method get
    Then status 200
    And match $.status == 'RECHAZADA'
    And match $.messages[0].id == 'POC01'
    And match $.messages[0].description == 'Evaluacion.Politicas.POC01'