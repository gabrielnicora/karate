@checkSignature
Feature: Chequear servicio para dar de baja polizas de ATM

    @regression @regression_green
    Scenario: La firma del servicio para dar de baja polizas de ATM no sufre cambios desde Sancor
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
                    "RiskTypeId": "1",
                    "Zone": "30001",
                    "type": "TheftBranch"
                },
                "Clients": [
                    {
                        "key": "2",
                        "value": {
                            "AreaCode": "11",
                            "BirthDate": "1983-03-18T00:00:00",
                            "BirthPlaceCityDescription": "Rafaela",
                            "LocationData": {
                                "CityId": "30001",
                                "ZipCode": "1406"
                            },
                            "DocumentNumber": "30073575",
                            "DocumentType": "D",
                            "Email": "laura.strack@gmail.com",
                            "FirstName": "LAURA SOLEDAD",
                            "GenderId": "1",
                            "IvaConditionId": "4",
                            "LastName": "STRACK",
                            "PhoneNumber": "32503333",
                            "Street": "Gavilan 347"
                        }
                    }
                ],
                "CoverModuleCode": "4",
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
                        "78432900"
                    ]
                },
                "Since": "#(startPolicyDate)",
                "Thru": "2022-09-16T00:00:00"
            },
            "CurrencyId": "1",
            "OrganizerNumber": "150113",
            "ProducerNumber": "208829",
            "ProductId": "879",
            "RenewalTypeId": "1",
            "StatisticCodeIds": "1624"
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
            "branchCode": 700,
            "productCode": 21,
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