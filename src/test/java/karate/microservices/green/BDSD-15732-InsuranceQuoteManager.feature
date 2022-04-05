@insurance-quote-manager
Feature: Consultar al Microservicio para cotizar los planes de cobertura segun el CP

    Scenario:  BDSD-16179 - Comprobar todos los datos del plan 44
        * url wiremockBaseUrl
        * def zipcode = 3200
        Given  path 'pre/ssa/channel/quotations/protectedhome'
        And request '{\"CoverModuleCodes\": [44]}'
        And method post
        Then match response.Success == 'true'
        * def sancorResponse = response
        * url insuranceBaseUrl
        When  path 'insurance-quote-manager/v1/quote/' + zipcode
        And method post
        * def finallyCalculationResultListSize = response.Plans[0].FinallyCalculationResult.length
        * def finallyCalculationResultListSancorSize = sancorResponse.Plans[0].FinallyCalculationResult.length
        Then match response.Plans[0].Module == sancorResponse.Plans[0].Module
        And match response.Plans[0].PremioSegunVigencia == sancorResponse.Plans[0].PremioSegunVigencia
        And match response.Plans[0].PremioMensual == sancorResponse.Plans[0].PremioMensual
        And match finallyCalculationResultListSize == finallyCalculationResultListSancorSize
        And match response.Plans[0].PremioMensual == sancorResponse.Plans[0].PremioMensual
        And match response.Plans[0].ModuleDescription == "1500"
        And match response.Plans[0].FinallyCalculationResult[0].DetalleCoberturaBDS  == '#notnull'

    Scenario:  BDSD-16181 - Comprobar todos los datos del plan 46
        * url wiremockBaseUrl
        * def zipcode = 3200
        Given  path 'pre/ssa/channel/quotations/protectedhome'
        And request '{\"CoverModuleCodes\": [46]}'
        And method post
        Then match response.Success == 'true'
        * def sancorResponse = response
        * print response
        * url insuranceBaseUrl
        When  path 'insurance-quote-manager/v1/quote/' + zipcode
        And method post
        * def finallyCalculationResultListSize = response.Plans[2].FinallyCalculationResult.length
        * def finallyCalculationResultListSancorSize = sancorResponse.Plans[0].FinallyCalculationResult.length
        Then match response.Plans[1].Module == sancorResponse.Plans[0].Module
        And match response.Plans[1].PremioSegunVigencia == sancorResponse.Plans[0].PremioSegunVigencia
        And match response.Plans[1].PremioMensual == sancorResponse.Plans[0].PremioMensual
        And match finallyCalculationResultListSize == finallyCalculationResultListSancorSize
        And match response.Plans[1].ModuleDescription == "2100"
        And match response.Plans[1].FinallyCalculationResult[0].DetalleCoberturaBDS  == '#notnull'

    Scenario:  BDSD-16180 - Comprobar todos los datos del plan 51
        * url wiremockBaseUrl
        * def zipcode = 3200
        Given  path 'pre/ssa/channel/quotations/protectedhome'
        And request '{\"CoverModuleCodes\": [51]}'
        And method post
        Then match response.Success == 'true'
        * def sancorResponse = response
        * url insuranceBaseUrl
        When  path 'insurance-quote-manager/v1/quote/' + zipcode
        And method post
        * def finallyCalculationResultListSize = response.Plans[2].FinallyCalculationResult.length
        * def finallyCalculationResultListSancorSize = sancorResponse.Plans[0].FinallyCalculationResult.length
        Then match response.Plans[2].Module == sancorResponse.Plans[0].Module
        And match response.Plans[2].PremioSegunVigencia == sancorResponse.Plans[0].PremioSegunVigencia
        And match response.Plans[2].PremioMensual == sancorResponse.Plans[0].PremioMensual
        And match finallyCalculationResultListSize == finallyCalculationResultListSancorSize
        And match response.Plans[2].ModuleDescription == "4500"
        And match response.Plans[2].FinallyCalculationResult[0].DetalleCoberturaBDS  == '#notnull'

    Scenario:  BDSD-16182 - Consultar utilizando un CP invalido
        * def zipcode = 'bds'
        * url insuranceBaseUrl
        When  path 'insurance-quote-manager/v1/quote/' + zipcode
        And method post

    Scenario:  BDSD-16183 - Consultar utilizando un CP inexistente
        * def zipcode = 0000
        * url insuranceBaseUrl
        When  path 'insurance-quote-manager/v1/quote/' + zipcode
        And method post

