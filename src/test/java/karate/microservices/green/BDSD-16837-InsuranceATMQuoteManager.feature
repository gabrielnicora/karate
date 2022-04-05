@green @insurance-quote-manager
Feature: Consultar al Microservicio de cotizacion de ATM

    @regression @regression_green
    Scenario:  BDSD-19251 - Comprobar todos los datos del plan se mapean correctamente
        * url wiremockBaseUrl
        * def zipcode = 1000
        Given  path 'pre/ssa/channel/quotations/theft/atm'
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
        Then match response.Quotation.Success == true
        * def sancorResponse = response
        * print response
        * url insuranceBaseUrl
        When  path 'insurance-quote-manager/v2/theft/quote/atm/' + zipcode
        And method post
        * print response
        * def AdditionalsCalculationResultListSize = response.Additionals.length
        * def AdditionalsCalculationResultListSancorSize = sancorResponse.Quotation.Plans[0].AdditionalsCalculationResult.length
        And match AdditionalsCalculationResultListSize == AdditionalsCalculationResultListSancorSize
        And match response.Plans[0].PremioSegunVigencia == sancorResponse.Quotation.Plans[0].PremioSegunVigencia
        And match response.Plans[0].PremioMensual == sancorResponse.Quotation.Plans[0].PremioMensual
        And match response.Plans[0].ModuleDescription == "10000"
        And match response.Plans[0].Module == "4"
        And match response.Plans[0].FinallyCalculationResult[0].featured == '#boolean'
        And match response.Plans[0].FinallyCalculationResult[0].PrimaMensual == '#number'
        And match response.Plans[0].FinallyCalculationResult[0].Detalle == '#string'
        And match response.Plans[0].FinallyCalculationResult[0].claimService == '#boolean'
        And match response.Plans[0].FinallyCalculationResult[0].Descripcion == '#string'
        And match response.Plans[0].FinallyCalculationResult[0].DetalleInt == '#number'
        And match response.Plans[0].FinallyCalculationResult[0].Capital == '#number'
        And match response.Plans[0].FinallyCalculationResult[0].DetalleCoberturaBDS == '#string'
        And match response.Plans[0].FinallyCalculationResult[0].PrimaSegunVigencia == '#number'
        And match response.Plans[0].FinallyCalculationResult[0].TipoDetalle == '#string'



