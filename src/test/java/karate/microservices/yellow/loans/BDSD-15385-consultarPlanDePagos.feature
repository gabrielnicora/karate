Feature: Consultar plan de pagos de una simulación

Background:
    * url loansBaseUrl

Scenario:  BDSD-15865 - Consultar plan de pago de una simulacion existente
    * def solicitarSimulacion = call read('BDSD-15925-solicitarSimulacion.feature@solicitarSimulacion')	
    Given path 'simulations', solicitarSimulacion.id, 'payment-plan'
    And method get
    Then status 200

Scenario:  BDSD-15866 - Consultar plan de pago de una simulacion inexistente
    Given path 'simulations', '6112d509579', 'payment-plan'
    And method get
    Then status 404