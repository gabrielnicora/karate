@int @regression @regression_yellow
Feature: BDSD-16947 - Solicitar a Experian evaluación crediticia (con Mock)

  Background:
    * url scoringBaseUrl
    * def bodyApproved = '20415752130'
    * def bodyRejected = '20383802271'
    * def bodyError = '20383802272'
    * def bodyManualReview = '20383802273'

  Scenario: BDSD-17581 - Solicitar a Experian evaluación crediticia con resultado aprobado
    Given path 'offers', 'internal'
    And def body =
    """
    {
        "cuil": '#(bodyApproved)',
        "pasCode": '213123'
    }
    """
    When request body
    And method post
    And status 200
    And match $.status == 'APROBADA'

  Scenario: BDSD-17582 - Solicitar a Experian evaluación crediticia con resultado Rechazado
    Given path 'offers', 'internal'
    And def body =
    """
    {
        "cuil": '#(bodyRejected)'
    }
    """
    When request body
    And method post
    And status 200
    And match $.status == 'RECHAZADA'

  Scenario: BDSD-17583 - Solicitar a experian evaluación crediticia con resultado Error
    Given path 'offers', 'internal'
    And def body =
    """
    {
        "cuil": '#(bodyError)'
    }
    """
    When request body
    And method post
    And status 200
    And match $.status == 'ERROR'

  Scenario: BDSD-17584 - Solicitar a experian evaluación crediticia con resultado Revisión Manual
    Given path 'offers', 'internal'
    And def body =
    """
    {
        "cuil": '#(bodyManualReview)'
    }
    """
    When request body
    And method post
    And status 200
    And match $.status == 'REVISION MANUAL'

