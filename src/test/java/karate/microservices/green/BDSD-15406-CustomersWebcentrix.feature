Feature: ABM de los usuarios en Webcentrix

    Background:
        * url customersBaseURL
        * def email = randomEmail
        Given header content-type = 'application/json'

    Scenario:  BDSD-16185 - Creacion de un nuevo usuario en Webcentrix
        When path 'webcentrix/customer/'
        And request
        """
        {
            "email": '#(email)'
        }
        """
        And method POST
        And status 200
        Then match response.id == '#present'
        And match response.id == '#notnull'

    Scenario:  BDSD-16186 - Consulta de un usuario en Webcentrix
        Given path 'webcentrix/customer/'
        And request
        """
        {
            "email": '#(email)'
        }
        """
        And method POST
        Then status 200
        * def id = response.id
        When path 'webcentrix/customer/' + id
        And method GET
        Then status 200
        And match response.id == id
        And match response.name == '#notnull'

    Scenario:  BDSD-16187 - Actualizacion de un usuario en Webcentrix
        Given path 'webcentrix/customer/'
        And request
        """
        {
            "email": '#(email)'
        }
        """
        And method POST
        Then status 200
        * def id = response.id
        When path 'webcentrix/customer/' + id
        And request
        """
        {
            "name": "Juan"
        }
        """
        And method PUT
        Then status 200
        And match response.id == id
        When path 'webcentrix/customer/' + id
        And method GET
        Then status 200
        And match response.id == id
        And match response.name == 'Juan'