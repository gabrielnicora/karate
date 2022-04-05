@green
Feature: Servicio para obtener las polizas del usuario

    Background:
        * url insuranceBaseUrl
        * def personId = "8791"
        * def userNotPoliciesPersonId = "10143"

    @regression @regression_green
    Scenario:  BDSD-17855 - El servicio responde correctamente y obtiene datos
        Given path 'persons/' + personId + '/policies'
        And method get
        And status 200
        Then match response.policies == '#array'
        And match response.policies[0].branchCode == '#string'
        And match response.policies[0].referenceNumber == '#string'
        And match response.policies[0].isValid == '#boolean'
        And match response.policies[0].officialNumber == '#string'
        And match response.policies[0].branchName == '#string'
        And match response.policies[0].policyStartEffectiveDate == '#string'

    @regression @regression_green @s
    Scenario:  BDSD-17856 - El usuario no tiene polizas
        Given path 'persons/' + userNotPoliciesPersonId + '/policies'
        And method get
        And status 200
        * def policies = response.policies.length
        And match policies == 0