@insurance-manager
Feature: Servicio para baja de polizas

Background:
    * url signBaseUrl
    * def mail = "hmateikabdsolqe@gmail.com"
    * def personId = "8791"

    @regerssion @regression_green
    Scenario:  BDSD-18206 - Se emite una poliza y luego se realiza la baja de la misma
        # Se obtiene el accessToken de cliente
        Given path 'v1/link-account-token'
        And header bds-device = 'fiuhueh'
        And request
            """
            {"deviceId":"fiuhueh","email":"#(mail)","appBundleId":"{{appBundleId}}"}
            """
        And method POST
        And status 200
        * def actionToken = response.actionToken
        * url insuranceBaseUrl
        # Se genera una nueva poliza para el cliente
        And path 'policies'
        And header Authorization = "Bearer " + actionToken
        And request
            """
            {
              "userAddress": { "zip": "6600", "cityId": "14696", "street": "4", "number": "4340" },
              "riskAddress": { "zip": "6600", "cityId": "14696", "street": "San Luis", "number": "4340" },
              "phone": { "areaCode": "11", "number": "42104689" },
              "coverId": "46",
              "additionals": [],
              "policyType": "protectedhome",
              "cbu": "123456789"
               }
            """
        And method POST
        And status 201
        * url insuranceBaseUrl
        # Se realiza la baja de la poliza
        When path 'policies/1800-' + response.referenceNumber
        And header Authorization = "Bearer " + actionToken
        And request
            """
            {
              "reasonId": "asdas"
            }
            """
        And method delete
        And status 200
        And match response.number == '#string'
        And match response.status.id == '#number'
        And match response.status.description == '#string'

    @regerssion @regression_green
    Scenario:  BDSD-18207 - Se envian letras en vez de parametros numericos
        * url insuranceBaseUrl
        When path 'policies/a-a'
        And method delete
        And status 404

    @regerssion @regression_green
    Scenario:  BDSD-18208 - No se envian los parametros
        * url insuranceBaseUrl
        When path 'policies/'
        And method delete
        And status 404

