@checkSignature
Feature: Chequear servicio para emitir polizas de HOME

    @regression @regression_green
    Scenario: La firma del servicio para emitir polizas de HOME no sufre cambios desde Sancor
        * url insuranceBaseUrl
        Given path 'insurance-token-manager/v1/token'
        And method get
        And status 200
        * def token = response.Token
        * def startPolicyDate = getTodayDate
        * url insuranceSancorBaseUrl
        Given  path 'pre/ssa/channel/policies/single'
        And header Authorization = "Bearer " + token
        And header Content-Type = "application/json"
        And request
        """
        {
            "CertificateData": {
                "BranchData": {
                    "BuildingRepositionToNew": true,
                    "FloorsNumber": "1",
                    "NoDeductible": "0",
                    "SummerPack": false,
                    "type": "FamilyCombinedBranch"
                },
                "Clients": [
                    {
                        "key": "2",
                        "value": {
                            "AreaCode": "3493",
                            "BirthDate": "1981-03-02T00:00:00",
                            "BirthPlaceCityDescription": "Rafaela",
                            "LocationData": {
                                "CityId": "1214",
                                "ZipCode": "2322"
                            },
                            "DocumentNumber": "20284733488",
                            "DocumentType": "D",
                            "Email": "cris_17b@hotmail.com",
                            "FirstName": "Cristian Javier",
                            "GenderId": "1",
                            "IvaConditionId": "4",
                            "LastName": "Biolatto",
                            "PhoneNumber": "403709",
                            "Street": "Lopez 1391"
                        }
                    }
                ],
                "CoverModuleCode": "45",
                "Covers": [
                    {
                        "Capital": "0",
                        "CoverCode": "0"
                    }
                ],
                "DebitData": {
                    "CreditCardExpiration": "2024-07-01T03:00:00Z",
                    "CreditCardId": "2",
                    "CreditCardNumber": "5456524780193766"
                },
                "DebitTypeId": "0",
                "ElectronicDispatchInformation": {
                    "ElectronicDispatchEmail": "laura.strack@gmail.com",
                    "IsElectronicallyDispatched": true
                },
                "PaymentFrequencyId": "5",
                "PolicyId": "0",
                "Quota": "0",
                "Quotation": {
                    "PricingIds": [
                        "78372060"
                    ]
                },
                "RiskAddress": {
                    "City": {
                        "CityId": "20679",
                        "ZipCode": "1145"
                    },
                    "Street": "Gavilan"
                },
                "Since": "#(startPolicyDate)",
                "Thru": "2023-01-19T00:00:00"
            },
            "CurrencyId": "1",
            "OrganizerNumber": "150113",
            "ProducerNumber": "208829",
            "ProductId": "459",
            "RenewalTypeId": "1",
            "StatisticCodeIds": "2036"
        }
        """
        And method post
        * print response
        Then match response.CertificatePolicy == '#present'
        And match response.CertificatePolicy.BranchId == '#string'
        And match response.CertificatePolicy.CertificatNumber == '#string'
        And match response.CertificatePolicy.ManagementNumber == '#string'
        And match response.CertificatePolicy.ManagementStatus == '#string'
        And match response.CertificatePolicy.OfficialNumber == '#string'
        And match response.CertificatePolicy.Receipt == '#present'
        And match response.CertificatePolicy.Receipt.Detail == '#array'
        And match response.CertificatePolicy.Receipt.Number == '#string'
        And match response.CertificatePolicy.ReferenceNumber == '#string'
