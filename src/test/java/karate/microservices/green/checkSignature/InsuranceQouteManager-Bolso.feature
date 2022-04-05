@checkSignature @insurance-quote-manager
Feature: Chequear servicio de cotizacion de seguros ATM

    @regression @regression_green
    Scenario: La firma del servicio de cotizacion de Bolso no sufre cambios desde Sancor
        * url insuranceBaseUrl
        Given path 'insurance-token-manager/v1/token'
        And method get
        And status 200
        * def token = response.Token
        * url insuranceSancorBaseUrl
        Given path 'pre/ssa/channel/quotations/theft/protectedbag'
        And header Authorization = "Bearer " + token
        And header Content-Type = "application/json"
        And request
        """
        {
             "LocationData": {
                "CityId": 30001,
                "ZipCode": 1406
            },
            "ClientIdentify": {
                "DocumentNumber": 0,
                "DocumentType": "D"
            },
            "CoverModuleCodes": [6,7,9],
            "CurrencyId": 1,
            "EffectDate": "2022-03-17T00:00:00",
            "ExpirationDate": "2023-09-16T00:00:00",
            "IvaConditionId": 4,
            "OfficeId": 200,
            "PaymentFrequencyId": 5,
            "ProducerId": 207343,
            "ProductId": 879,
            "QuotaQuantity": 0,
            "RespectClientIvaCondition": true,
            "StatisticalCode": 2036
        }
        """
        And method post
        * print response
        Then match response.Quotation == '#present'
        And match response.Quotation.Plans == '#array'
        * def planListSize = response.Quotation.Plans.length
        And match planListSize == 3
        And match response.Quotation.Plans[0].PricingId == '#array'
        And match response.Quotation.Plans[0].PricingId[0] == '#number'
        And match response.Quotation.Plans[0].FinallyCalculationResult == '#array'
        And match response.Quotation.Plans[0].FinallyCalculationResult[0].PrimaMensual == '#number'
        And match response.Quotation.Plans[0].FinallyCalculationResult[0].Detalle == '#string'
        And match response.Quotation.Plans[0].FinallyCalculationResult[0].Descripcion == '#string'
        And match response.Quotation.Plans[0].FinallyCalculationResult[0].DetalleInt == '#number'
        And match response.Quotation.Plans[0].FinallyCalculationResult[0].Capital == '#number'
        And match response.Quotation.Plans[0].FinallyCalculationResult[0].PrimaSegunVigencia == '#number'
        And match response.Quotation.Plans[0].FinallyCalculationResult[0].TipoDetalle == '#string'
        And match response.Quotation.Plans[0].BasesImponibles == '#array'
        And match response.Quotation.Plans[0].PremioSegunVigencia == '#number'
        And match response.Quotation.Plans[0].AdditionalsCalculationResult == '#array'
        And match response.Quotation.Plans[0].PremioMensual == '#number'
