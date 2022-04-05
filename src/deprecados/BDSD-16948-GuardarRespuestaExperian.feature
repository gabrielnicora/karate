@int @regression @regression_yellow
Feature: BDSD-16948 - Consulta (Guardar respuesta de Experian)

  Background:
    * url scoringBaseUrl
    * def Approved = '20383802270'
    * def Rejected = '20383802271'
    * def Error = '20383802272'
    * def ManualReview = '20383802273'
    
  Scenario: BDSD-17668 - Obtiene el resultado de la solicitud a Experian de evaluación crediticia con resultado aprobado (Karate)
    Given path 'offers', 'internal', Approved
    When method get
    Then status 200
    And match $.status == 'APROBADA'

  Scenario: BDSD-17669 - Obtiene el resultado de la solicitud a Experian de evaluación crediticia con resultado Rechazado (Karate)
    Given path 'offers', 'internal', Rejected
    When method get
    Then status 200
    And match $.status == 'RECHAZADA'

  Scenario: BDSD-17670 - Obtiene el resultado de la solicitud a experian evaluación crediticia con resultado Error (Karate)
    Given path 'offers', 'internal', Error
    When method get
    Then status 200
    And match $.status == 'ERROR'

  Scenario: BDSD-17671 - Obtiene el resultado de la solicitud a experian evaluación crediticia con resultado Revisión Manual (Karate)
    Given path 'offers', 'internal', ManualReview
    When method get
    Then status 200
    And match $.status == 'REVISION MANUAL'

