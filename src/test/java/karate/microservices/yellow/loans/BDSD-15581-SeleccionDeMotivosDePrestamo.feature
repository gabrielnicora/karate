Feature: Selección de motivos de préstamos

Background:
    * url loansBaseUrl
    * def token = 'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJ1bWNvTkJJZFZnUFlPeFQ3Wm5RN0JTUFlSS0dELWdoUkc2eXhsMlFWeDVvIn0.eyJleHAiOjE2MzQ3NjI2NjUsImlhdCI6MTYzMjE3MDY2NSwianRpIjoiYTRmZTc4NTctYzkwYy00YWI5LWI4YTQtODQ4OGUzNTExNWQzIiwiaXNzIjoiaHR0cDovL2tleWNsb2FrLWludC5iZHNkaWdpdGFsLmNvbS5hci9hdXRoL3JlYWxtcy9iZHMtaW50IiwiYXVkIjoiaHR0cDovL2tleWNsb2FrLWludC5iZHNkaWdpdGFsLmNvbS5hci9hdXRoL3JlYWxtcy9iZHMtaW50Iiwic3ViIjoiMGVkYzM1OTctMTFmMi00NGIxLWE2MmYtYmUzOGVhZGUwNjU3IiwidHlwIjoibGluay1hY2NvdW50LWFjdGlvbi10b2tlbiIsIm5vbmNlIjoiYTRmZTc4NTctYzkwYy00YWI5LWI4YTQtODQ4OGUzNTExNWQzIiwiZGV2aWNlX2lkIjoiYTZkNjkxMDVmN2Y0YjEwZCIsInVzZXJfaWQiOiIwZWRjMzU5Ny0xMWYyLTQ0YjEtYTYyZi1iZTM4ZWFkZTA2NTciLCJwZXJzb25faWQiOiIxNiIsImFzaWQiOm51bGx9.gc5suwhtmTKfGUNlsICjfwUG5nAstAX0JKMkw9I0dTv6Ae-vEi7RnaEZ-0XfZDeE8l2ZfrIzA-9NazQg3SZjbefFik57b9wgBbuA-wwf7a2RR73AqvwJu-TaA2Su-ufVYfscqs5qzP-QVZchaY_FWcozWsR5nTXVD5g_GclfD7pmER1OZVWQQzcbVVm-B7CYBfeMxwC8PKovfIQB9dN5yM8hNbRM6sAJQCpI2B-0ex_6xMfj_WfUNYcGWvoS1yTnwJcf1QwNIV2SusjNe8W2sGzAO5z7PpIw-nGOC5dJ7WGjM3NA9cg9Ncl-eY55kfMr5wyfIrOASHpY2kmQTHGKEQ'

Scenario:  BDSD-16201 - Se obtienen los distintos motivos guardados en la base
    Given path 'reasons'
    And method get
    Then status 200
    * def array = response
    * def size = karate.sizeOf(array)
    And match size == 9

@obtenerMotivoAleatorio
Scenario: BDSD-16208 - Se obtiene un motivo aleatorio del 1 al 9 especificando ID
    * def generateNumber =
    """
        function() {
        return Math.round(Math.random() * (1 - 9) + 10);
        }
    """
    * def idAleatorio = generateNumber()
    Given path 'reasons', idAleatorio
    And method get
    Then status 200
    And match response.id == idAleatorio
    * def id = response.id
    * def description = response.description
    * def auroraCode = response.auroraCode
    * def coreCode = response.coreCode
    * def coreDescription = response.coreDescription

    Scenario: BDSD-16209 - Se selecciona un motivo enviándolo al patch para que actualice la simulación existente
        * def idSimulacion = '6112d5092c928d0f5f044579'
        * def solicitarMotivo = call read('BDSD-15581-SeleccionDeMotivosDePrestamo.feature@obtenerMotivoAleatorio')	
        Given path 'simulations', idSimulacion
        And request
        """
        {
            "reason": {
                "id": '#(solicitarMotivo.id)',
                "description": '#(solicitarMotivo.description)',
                "auroraCode": '#(solicitarMotivo.auroraCode)',
                "coreCode": '#(solicitarMotivo.coreCode)',
                "coreDescription": '#(solicitarMotivo.coreDescription)',
            }
        }
        """
        And method patch
        And status 200
        And path 'simulations', idSimulacion
        And header Authorization = 'Bearer ' + token
        And method get
        Then status 200
        And match response.reason.id == solicitarMotivo.id
        And match response.reason.description == solicitarMotivo.description
        And match response.reason.auroraCode == solicitarMotivo.auroraCode
        And match response.reason.coreCode == solicitarMotivo.coreCode
        And match response.reason.coreDescription == solicitarMotivo.coreDescription
        