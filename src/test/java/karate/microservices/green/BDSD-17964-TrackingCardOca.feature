@green
Feature: Servicio de tracking de tarjetas en OCA wiremockBaseUrl


    @regression @regression_green
    Scenario:  BDSD-18743 - El servicio mapea correctamente el estado (1) 'En proceso de retiro'
        * url wiremockBaseUrl
        Given path 'scenario/ocaTrack/status1'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status1'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status1'
        And method get
        And status 200
        When path '/HistorialSeguimiento'
        And method post
        And status 200
        * def statusSize = response.Historiales[0].Historial.length
        Then match statusSize == 1
        And match response.Historiales[0].Historial[0].EstadoWebOCA == 'En proceso de Retiro'
        * url trackingBaseUrl
        When path '/packages/101010'
        And method get
        And status 200
        * def statusArraySize = response.length
        Then match statusArraySize == 1
        And match response[0].statusCode == '1'

    @regression @regression_green
    Scenario:  BDSD-18744 - El servicio mapea correctamente el estado (3) 'En proceso en OCA'
        * url wiremockBaseUrl
        Given path 'scenario/ocaTrack/status3'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status3'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status3'
        And method get
        And status 200
        When path '/HistorialSeguimiento'
        And method post
        And status 200
        * def statusSize = response.Historiales[0].Historial.length
        Then match statusSize == 3
        And match response.Historiales[0].Historial[2].EstadoWebOCA == 'En Proceso en OCA'
        * url trackingBaseUrl
        When path '/packages/101010'
        And method get
        And status 200
        * def statusArraySize = response.length
        Then match statusArraySize == 1
        And match response[0].statusCode == '1'

    @regression @regression_green
    Scenario:  BDSD-18745 - El servicio mapea correctamente el estado (4) 'En viaje a Sucursal de Destino'
        * url wiremockBaseUrl
        Given path 'scenario/ocaTrack/status4'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status4'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status4'
        And method get
        And status 200
        When path '/HistorialSeguimiento'
        And method post
        And status 200
        * def statusSize = response.Historiales[0].Historial.length
        Then match statusSize == 4
        And match response.Historiales[0].Historial[3].EstadoWebOCA == 'En viaje a Sucursal de Destino'
        * url trackingBaseUrl
        When path '/packages/101010'
        And method get
        And status 200
        * def statusArraySize = response.length
        Then match statusArraySize == 2
        And match response[1].statusCode == '2'

    @regression @regression_green
    Scenario:  BDSD-18746 - El servicio mapea correctamente el estado (5) 'Arribado a Sucursal de Destino'
        * url wiremockBaseUrl
        Given path 'scenario/ocaTrack/status5'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status5'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status5'
        And method get
        And status 200
        When path '/HistorialSeguimiento'
        And method post
        And status 200
        * def statusSize = response.Historiales[0].Historial.length
        Then match statusSize == 5
        And match response.Historiales[0].Historial[4].EstadoWebOCA == 'Arribado a Sucursal de Destino'
        * url trackingBaseUrl
        When path '/packages/101010'
        And method get
        And status 200
        * def statusArraySize = response.length
        Then match statusArraySize == 2
        And match response[1].statusCode == '2'

    @regression @regression_green
    Scenario:  BDSD-18747 - El servicio mapea correctamente el estado (6) 'Procesado en OCA'
        * url wiremockBaseUrl
        Given path 'scenario/ocaTrack/status6'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status6'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status6'
        And method get
        And status 200
        When path '/HistorialSeguimiento'
        And method post
        And status 200
        * def statusSize = response.Historiales[0].Historial.length
        Then match statusSize == 7
        And match response.Historiales[0].Historial[6].EstadoWebOCA == 'Procesado en OCA'
        * url trackingBaseUrl
        When path '/packages/101010'
        And method get
        And status 200
        * def statusArraySize = response.length
        Then match statusArraySize == 2
        And match response[1].statusCode == '2'

    @regression @regression_green
    Scenario:  BDSD-18748 - El servicio mapea correctamente el estado (7) 'Visita a Domicilio en Curso'
        * url wiremockBaseUrl
        Given path 'scenario/ocaTrack/status7'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status7'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status7'
        And method get
        And status 200
        When path '/HistorialSeguimiento'
        And method post
        And status 200
        * def statusSize = response.Historiales[0].Historial.length
        Then match statusSize == 8
        And match response.Historiales[0].Historial[7].EstadoWebOCA == 'Visita a Domicilio en Curso'
        * url trackingBaseUrl
        When path '/packages/101010'
        And method get
        And status 200
        * def statusArraySize = response.length
        Then match statusArraySize == 2
        And match response[1].statusCode == '2'

    @regression @regression_green
    Scenario:  BDSD-18749 - El servicio mapea correctamente el estado (8) 'Reprogramado para nueva visita'
        * url wiremockBaseUrl
        Given path 'scenario/ocaTrack/status8'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status8'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status8'
        And method get
        And status 200
        When path '/HistorialSeguimiento'
        And method post
        And status 200
        * def statusSize = response.Historiales[0].Historial.length
        Then match statusSize == 9
        And match response.Historiales[0].Historial[8].EstadoWebOCA == 'Reprogramado para nueva visita'
        * url trackingBaseUrl
        When path '/packages/101010'
        And method get
        And status 200
        * def statusArraySize = response.length
        Then match statusArraySize == 3
        And match response[2].statusCode == '3'

    @regression @regression_green
    Scenario:  BDSD-18750 - El servicio mapea correctamente el estado (9) 'Entregado'
        * url wiremockBaseUrl
        Given path 'scenario/ocaTrack/status9'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status9'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status9'
        And method get
        And status 200
        When path '/HistorialSeguimiento'
        And method post
        And status 200
        * def statusSize = response.Historiales[0].Historial.length
        Then match statusSize == 9
        And match response.Historiales[0].Historial[8].EstadoWebOCA == 'Entregado'
        * url trackingBaseUrl
        When path '/packages/101010'
        And method get
        And status 200
        * def statusArraySize = response.length
        Then match statusArraySize == 3
        And match response[2].statusCode == '4'

    @regression @regression_green
    Scenario: BDSD-19238 - El servicio mapea correctamente el estado (10) 'No entregado'
        * url wiremockBaseUrl
        Given path 'scenario/ocaTrack/status10'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status10'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status10'
        And method get
        And status 200
        When path '/HistorialSeguimiento'
        And method post
        And status 200
        * def statusSize = response.Historiales[0].Historial.length
        Then match statusSize == 9
        * url trackingBaseUrl
        When path '/packages/101010'
        And method get
        And status 200
        * def statusArraySize = response.length
        Then match statusArraySize == 3
        And match response[2].statusCode == '3'

    @regression @regression_green
    Scenario:  BDSD-18751 - El servicio mapea correctamente el estado (11) 'En Espera de Retiro por Sucursal'
        * url wiremockBaseUrl
        Given path 'scenario/ocaTrack/status11'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status11'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status11'
        And method get
        And status 200
        When path '/HistorialSeguimiento'
        And method post
        And status 200
        * def statusSize = response.Historiales[0].Historial.length
        Then match statusSize == 10
        And match response.Historiales[0].Historial[9].EstadoWebOCA == 'En Espera de Retiro por Sucursal'
        * url trackingBaseUrl
        When path '/packages/101010'
        And method get
        And status 200
        * def statusArraySize = response.length
        Then match statusArraySize == 4
        And match response[3].statusCode == '6'

    @regression @regression_green
    Scenario:  BDSD-18752 - El servicio mapea correctamente el estado (13) 'Devuelto al Remitente'
        * url wiremockBaseUrl
        Given path 'scenario/ocaTrack/status13'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status13'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status13'
        And method get
        And status 200
        When path '/HistorialSeguimiento'
        And method post
        And status 200
        * def statusSize = response.Historiales[0].Historial.length
        Then match statusSize == 11
        And match response.Historiales[0].Historial[10].EstadoWebOCA == 'Devuelto al Remitente'
        * url trackingBaseUrl
        When path '/packages/101010'
        And method get
        And status 200
        * def statusArraySize = response.length
        Then match statusArraySize == 5
        And match response[4].statusCode == '3'

    @regression @regression_green
    Scenario: BDSD-18906 - El servicio mapea correctamente el estado (12) 'Devolución en Proceso'
        * url wiremockBaseUrl
        Given path 'scenario/ocaTrack/status12'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status12'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status12'
        And method get
        And status 200
        When path '/HistorialSeguimiento'
        And method post
        And status 200
        * def statusSize = response.Historiales[0].Historial.length
        Then match statusSize == 10
        And match response.Historiales[0].Historial[9].EstadoWebOCA == 'No pudimos entregar tu tarjeta'
        * url trackingBaseUrl
        When path '/packages/101010'
        And method get
        And status 200
        * def statusArraySize = response.length
        Then match statusArraySize == 4
        And match response[3].statusCode == '5'

    @regression @regression_green
    Scenario: BDSD-18907 - El servicio mapea correctamente el estado (14) 'Envío Cancelado'
        * url wiremockBaseUrl
        Given path 'scenario/ocaTrack/status14'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status14'
        And method get
        And status 200
        Given path 'scenario/ocaTrack/status14'
        And method get
        And status 200
        When path '/HistorialSeguimiento'
        And method post
        And status 200
        * def statusSize = response.Historiales[0].Historial.length
        Then match statusSize == 11
        * url trackingBaseUrl
        When path '/packages/101010'
        And method get
        And status 200
        * def statusArraySize = response.length
        Then match statusArraySize == 5
        And match response[4].statusCode == '5'