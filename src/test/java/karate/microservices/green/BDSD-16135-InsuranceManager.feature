@insurance-manager
Feature: Serivcio para la Confirmación de la solicitud de seguro

Background:
    * url signBaseUrl
    * def mail = "hmateikabdsolqe@gmail.com"

    @regerssion @regression_green
    Scenario:  BDSD-17554 - Se emite una poliza correctamente y los campos del response son correctos
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
        Then match response.referenceNumber == '#string'
        And match response.managementNumber == '#string'
        And match response.receipt.number == '#string'
        And match response.receipt.detail == '#array'
        And match response.receipt.detail[0].description == '#string'
        And match response.receipt.detail[0].anualPremium == '#number'
        And match response.receipt.detail[0].monthPremium == '#number'
        And match response.branchCode == "1800"

    @regerssion @regression_green
    Scenario:  BDSD-17555 - No se envia el campo coverId
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
        And path 'policies/protectedhome'
        And header Authorization = "Bearer " + actionToken
        And request
        """
        {
          "userAddress": { "zip": "6600", "cityId": "14696", "street": "4", "number": "4340" },
          "riskAddress": { "zip": "6600", "cityId": "14696", "street": "San Luis", "number": "4340" },
          "phone": { "areaCode": "11", "number": "42104689" },
          "additionals": [],
          "cbu": "123456789"
           }
        """
        And method POST
        And status 400
        Then match response.path == '/policies/protectedhome'

    @regerssion @regression_green
    Scenario:  BDSD-17556 - No se envia el campo userAddress
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
        And path 'policies/protectedhome'
        And header Authorization = "Bearer " + actionToken
        And request
        """
        {
          "riskAddress": { "zip": "6600", "cityId": "14696", "street": "San Luis", "number": "4340" },
          "phone": { "areaCode": "11", "number": "42104689" },
          "coverId": "46",
          "additionals": [],
          "cbu": "123456789"
           }
        """
        And method POST
        And status 400
        Then match response.path == '/policies/protectedhome'

    @regerssion @regression_green
    Scenario:  BDSD-17557 - No se envia el campo riskAddress
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
        And path 'policies/protectedhome'
        And header Authorization = "Bearer " + actionToken
        And request
        """
        {
          "userAddress": { "zip": "6600", "cityId": "14696", "street": "4", "number": "4340" },
          "phone": { "areaCode": "11", "number": "42104689" },
          "coverId": "46",
          "additionals": [],
          "cbu": "123456789"
           }
        """
        And method POST
        And status 400
        Then match response.path == '/policies/protectedhome'
    
    @regerssion @regression_green
    Scenario:  BDSD-17557 - No se envia el campo cbu
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
        And path 'policies/protectedhome'
        And header Authorization = "Bearer " + actionToken
        And request
        """
        {
          "userAddress": { "zip": "6600", "cityId": "14696", "street": "4", "number": "4340" },
          "riskAddress": { "zip": "6600", "cityId": "14696", "street": "San Luis", "number": "4340" },
          "phone": { "areaCode": "11", "number": "42104689" },
          "coverId": "46",
          "additionals": [],
           }
        """
        And method POST
        And status 400
        Then match response.path == '/policies/protectedhome'


    @regerssion @regression_green
    Scenario:  BDSD-18429 - Se emite una poliza correctamente y con usuario que NO tiene un asesor vinculado
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
        And path 'policies/protectedhome'
        And header Authorization = "Bearer " + actionToken
        And request
            """
            {
              "userAddress": { "zip": "6600", "cityId": "14696", "street": "4", "number": "4340" },
              "riskAddress": { "zip": "6600", "cityId": "14696", "street": "San Luis", "number": "4340" },
              "phone": { "areaCode": "11", "number": "42104689" },
              "coverId": "46",
              "additionals": [],
              "cbu": "123456789"
               }
            """
        And method POST
        And status 201
        Then match response.organizerCode == "152249"
        And match response.producerCode == "230223"

    @regerssion @regression_green
    Scenario:  BDSD-18430 - Se emite una poliza correctamente y con usuario que tiene un asesor vinculado
        Given path 'v1/link-account-token'
        * def mail = "t0192@bdsol.com.ar"
        And header bds-device = 'fiuhueh'
        And request
            """
            {"deviceId":"fiuhueh","email":"#(mail)","appBundleId":"{{appBundleId}}"}
            """
        And method POST
        And status 200
        * def actionToken = response.actionToken
        * url insuranceBaseUrl
        And path 'policies/protectedhome'
        And header Authorization = "Bearer " + actionToken
        And request
            """
            {
              "userAddress": { "zip": "6600", "cityId": "14696", "street": "4", "number": "4340" },
              "riskAddress": { "zip": "6600", "cityId": "14696", "street": "San Luis", "number": "4340" },
              "phone": { "areaCode": "11", "number": "42104689" },
              "coverId": "46",
              "additionals": [],
              "cbu": "123456789"
               }
            """
        And method POST
        And status 201
        Then match response.organizerCode == "227408"
        And match response.producerCode == "227408"