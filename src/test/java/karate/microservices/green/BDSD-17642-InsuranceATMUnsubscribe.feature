@insurance-manager
Feature: Servicio para baja de polizas de ATM

Background:
    * url signBaseUrl
    * def mail = "hmateikabdsolqe@gmail.com"
    * def personId = "8791"

    @regerssion @regression_green
    Scenario:  BDSD-19763 - Se emite una poliza de ATM y luego se realiza la baja de la misma
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
              "coverId": "4",
              "additionals":[],
              "userAddress": {
                "zip":"1440",
                "cityId":"305",
                "street":"Av Directorio",
                "number":"7136"
              },
              "cityId": "305",
              "phone": {
                "areaCode":"11",
                "number":"11234567"
              },
              "cbu": "3108100900010000932193",
              "policyType": "atm"
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

