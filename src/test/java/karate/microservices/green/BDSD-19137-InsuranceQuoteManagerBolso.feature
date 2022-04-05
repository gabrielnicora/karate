@green @insurance-quote-manager
Feature: Consultar al Microservicio de cotizacion de Bolso

    @regression @regression_green
    Scenario:  BDSD-20501 - Comprobar todos los datos del plan para Bolso se mapean correctamente
        * url wiremockBaseUrl
        * def zipcode = 1000
        Given  path '/pre/ssa/channel/quotations/theft/protectedbag'
        And request
        And method post
        Then match response.Quotation.Success == true
        * def sancorResponse = response
        * print response
        * url insuranceBaseUrl
        When  path '/insurance-quote-manager/v2/theft/quote/protectedBag/2705'
        And method post
        * print response
        * def AdditionalsCalculationResultListSize = response.Additionals.length
        * def AdditionalsCalculationResultListSancorSize = sancorResponse.Quotation.Plans[0].AdditionalsCalculationResult.length
        And match AdditionalsCalculationResultListSize == AdditionalsCalculationResultListSancorSize
        And match response.Plans[0].PremioSegunVigencia == sancorResponse.Quotation.Plans[0].PremioSegunVigencia
        And match response.Plans[0].PremioMensual == sancorResponse.Quotation.Plans[0].PremioMensual
        And match response.Plans[0].ModuleDescription == "10000"
        And match response.Plans[0].Module == "6"
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



