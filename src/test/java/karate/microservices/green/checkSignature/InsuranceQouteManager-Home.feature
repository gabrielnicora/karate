@checkSignature @insurance-quote-manager
Feature: Comprobar la firma del cotizador de polizas para Hogar

    Background:
        * url insuranceBaseUrl
        Given path 'insurance-token-manager/v1/token'
        And method get
        And status 200
        * def token = response.Token


    Scenario: La firma del cotizador de polizas para Hogar no sufrio cambios desde Sancor
        * url wiremockBaseUrl
        * def zipcode = 3200
        Given  path 'pre/ssa/channel/quotations/protectedhome'
        And header Authorization = "Bearer " + token
        And request
        """
        {
        "CoverModuleCodes": [44,46,51],
        "CurrencyId": 1,
        "DiscountCustomizations": [],
        "EffectDate": "2021-11-17T12:12:13.138571-03:00",
        "ExpirationDate": "2022-11-17T12:12:13.138571-03:00",
        "IvaConditionId": 4,
        "OfficeId": 301,
        "PaymentFrequencyId": 5,
        "OrganizerId": 152249,
        "ProducerId": 230223,
        "ProductId": 459,
        "RespectClientIvaCondition": true,
        "StatisticalCode": 2036,
        "ZipCode": '#(zipcode)',
        "PeriodOfValidityId": 1,
        "FeeId": 0,
        "AdditionalOption": []
        }
        """
        And method post
        Then match response.Success == 'true'
        * print response
        Then match response.Plans == '#array'
        * def planListSize = response.Plans.length
        And match planListSize == 3
        And match response.Plans[0].PricingId == '#string'
        And match response.Plans[0].FinallyCalculationResult == '#array'
        And match response.Plans[0].FinallyCalculationResult[0].PrimaMensual == '#number'
        And match response.Plans[0].FinallyCalculationResult[0].Detalle == '#string'
        And match response.Plans[0].FinallyCalculationResult[0].Descripcion == '#string'
        And match response.Plans[0].FinallyCalculationResult[0].DetalleInt == '#number'
        And match response.Plans[0].FinallyCalculationResult[0].Capital == '#number'
        And match response.Plans[0].FinallyCalculationResult[0].PrimaSegunVigencia == '#number'
        And match response.Plans[0].FinallyCalculationResult[0].TipoDetalle == '#string'
        And match response.Plans[0].BasesImponibles == '#array'
        And match response.Plans[0].PremioSegunVigencia == '#number'
        And match response.Plans[0].Module == '#string'
        And match response.Plans[0].AdditionalsCalculationResult == '#array'
        And match response.Plans[0].PremioMensual == '#number'
