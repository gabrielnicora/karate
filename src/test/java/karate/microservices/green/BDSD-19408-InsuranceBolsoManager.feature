@insurance-manager
Feature: Servicio para emitir un seguro de Bolso

Background:
    * url signBaseUrl
    * def mail = "hmateikabdsolqe@gmail.com"

    @regerssion @regression_green
    Scenario:  BDSD-20625 - Se emite una poliza de Bolso correctamente y los campos del response son correctos
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
              "policyType": "protectedbag"
            }
            """
        And method POST
        And status 201
        Then match response.referenceNumber == '#string'
        And match response.managementNumber == '#string'
        And match response.receipt.number == '#string'
        And match response.receipt.detail == '#array'
        And match response.receipt.detail[0].description == '#string'
        And match response.receipt.detail[0].anualPremium == '#number'
        And match response.receipt.detail[0].monthPremium == '#number'
        And match response.branchCode == "700"

