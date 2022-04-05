@checkSignature @insurance-quote-manager
Feature: Chequear servicio de cotizacion de seguros ATM

    @regression @regression_green
    Scenario: BDSD-19252 - La firma del servicio de cotizacion de ATM no sufre cambios desde Sancor
        * url insuranceBaseUrl
        Given path 'insurance-token-manager/v1/token'
        And method get
        And status 200
        * def token = response.Token
        * url insuranceSancorBaseUrl
        Given  path 'pre/ssa/channel/quotations/theft/atm'
        And header Authorization = "Bearer " + token
        And request
        """
        {
           "LocationData":{
              "CanonicalCityCode":0,
              "ZipCode":1000
           },
           "CoverCustomizations":{
              "Capital":10000,
              "CoverNumber":1
           },
           "CoverModuleCode":4,
           "CurrencyId":1,
           "EffectDate":"2022-01-05T17:43:30.279569700",
           "ExpirationDate":"2023-01-05T17:43:30.279569700",
           "IvaConditionId":4,
           "OfficeId":200,
           "PaymentFrequencyId":5,
           "OrganizerId":152249,
           "ProducerId":230223,
           "ProductId":896,
           "StatisticalCode":2036
        }
        """
        And method post
        * print response
        Then match response.Quotation == '#present'
        And match response.Quotation.Plans == '#array'
        * def planListSize = response.Quotation.Plans.length
        And match planListSize == 1
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
        And match response.Quotation.Plans[0].BasesImponibles[0].IvaSegunVigencia == '#number'
        And match response.Quotation.Plans[0].BasesImponibles[0].IvaMensual == '#number'
        And match response.Quotation.Plans[0].PremioSegunVigencia == '#number'
        And match response.Quotation.Plans[0].AdditionalsCalculationResult == '#array'
        And match response.Quotation.Plans[0].PremioMensual == '#number'
        And match response.Quotation.ValidationResults == '#array'
        And match response.Quotation.QuotationId == '#number'
        And match response.Quotation.RelationQuotationId == '#number'
        And match response.Quotation.Success == '#boolean'