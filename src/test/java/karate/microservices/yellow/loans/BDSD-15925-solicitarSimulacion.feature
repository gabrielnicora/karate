Feature: Solicitar la simulación de préstamo a T24

Background:
    * url signBaseUrl

    Given path '/v1/link-account-token'
    And request
    """
    {
        "deviceId"    :"a6d69105f7f4b10d",
        "email"       :"bdsolqeyellow@gmail.com",
        "appBundleId" :"ar.com.bdsol.bds.int"
    }
    """
    And method post
    * def token = response.actionToken

    * url loansBaseUrl

@revisarCASOErrorFirstPaymentDate
@solicitarSimulacion
Scenario:  BDSD-15863 - Solicitar simulación de préstamo a T24 utilizando un ID de cliente existente
    Given path 'simulations'
    And header bds-channel = 'mobile'
    And header Authorization = 'Bearer ' + token
    #And def body = '{ "clientId": "102403", "type": "PRESTAMOS.PERSONALES", "amount": 490000, "payments": 12, "pagare": false, "currency": "ARS", "firstPaymentDate": "2022-11-15T00:00:00.00Z", "tna": 0.8 }'
    And request
    """
    {
        "clientId": "102403",
        "type": "PRESTAMOS.PERSONALES",
        "amount": 740000,
        "payments": 18,
        "pagare": false,
        "currency": "ARS",
        "firstPaymentDate": "2022-11-15T00:00:00.00Z",
        "tna": 0.5
    }
    """
    And method post
    Then status 201
    * def id = $._id
    * def totalPayments = $.totalPayments
    # And match request.amount == last.amount
    # And match request.payments == totalPayments
    # Ya no podemos acceder en este caso a los campos enviados en la request porque no se define un body. Ya que con el body no seteaba bien los headers


Scenario:  BDSD-15864 - Solicitar simulación de préstamo a T24 utilizando un ID de cliente inexistente
    Given header bds-channel = 'mobile'
    And header Authorization = 'Bearer ' + token
    And path 'simulations'
    And request
    """
    {
        "clientId": "1024213123123103",
        "type": "PRESTAMOS.PERSONALES",
        "amount": 740000,
        "payments": 18,
        "pagare": false,
        "currency": "ARS",
        "firstPaymentDate": "2021-09-31T00:00:00.00Z",
        "tna": 0.5
    }
    """
    And method post
    Then status 400