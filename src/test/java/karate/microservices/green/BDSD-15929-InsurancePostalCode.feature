Feature: Servicio para obtener las localidades que componene un codigo postal

Background:
    * url insuranceBaseUrl

    Scenario:  BDSD-16915 - El servicio responde correctamente
    Given path 'insurance-postal-code/v1/locations?postalCode=2705'
    And method get
    And status 200

    Scenario:  BDSD-16916 - La respuesta del servicio contiene la cantidad de locallidades correspondientes al CP
        Given path 'insurance-postal-code/v1/locations?postalCode=2705'
        And method get
        And status 200
        * def cityAccount = response.length
        Then match cityAccount == 7

    Scenario:  BDSD-16917 - Los objetos ciudad obtenidos del servicio contienen sus datos correctamente
        Given path 'insurance-postal-code/v1/locations?postalCode=2705'
        And method get
        And status 200
        Then match response[0].cityPostalCode == "2705"
        And match response[0].cityName == "CUATRO DE NOVIEMBRE"
        And match response[0].stateName == "Buenos Aires"
        And match response[0].stateCode == "AR-B"
        And match response[0].canonicalCityCode == "1973"
        And match response[0].countryCode == "AR"
        And match response[0].countryName == "Argentina"
