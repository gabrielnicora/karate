@checkSignature
Feature: Chequear servicio para dar de baja polizas de HOME

    @regression @regression_green
    Scenario: La firma del servicio para dar de baja polizas de HOME no sufre cambios desde Sancor
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
        Then match response.messages[0].code == "GSS-200-000"
        When  path 'pre/ssa/channel/modification/certificate'
        And header Authorization = "Bearer " + token
        And header ClientTypeId = 2
        And header ApplicationId = 28
        And header CompanyCode = 5000
        And header Content-Type = "application/json"
        And request
        """
        {
            "branchCode": 1800,
            "productCode": 5,
            "referenceNumber": #(parseInt(response.CertificatePolicy.ReferenceNumber)),
            "officialNumber": #(parseInt(response.CertificatePolicy.OfficialNumber)),
            "certificateNumber": #(parseInt(response.CertificatePolicy.CertificatNumber)),
            "effectDate": "#(startPolicyDate)",
            "annulPolicyData": {
                "cancelationCauseId": 4
            }
        }
        """
        And method put
        * print response
        Then match response.managementData == '#present'
        And match response.managementData.number == '#string'
        And match response.managementData.status == '#present'
        And match response.managementData.status.description == '#string'
        And match response.managementData.status.id == '#number'