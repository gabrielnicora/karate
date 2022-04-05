Feature: Consultar resultado de la simulación de préstamo

Background:
    * url loansBaseUrl
    * def token = 'eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJ1bWNvTkJJZFZnUFlPeFQ3Wm5RN0JTUFlSS0dELWdoUkc2eXhsMlFWeDVvIn0.eyJleHAiOjE2MzQ3NjI2NjUsImlhdCI6MTYzMjE3MDY2NSwianRpIjoiYTRmZTc4NTctYzkwYy00YWI5LWI4YTQtODQ4OGUzNTExNWQzIiwiaXNzIjoiaHR0cDovL2tleWNsb2FrLWludC5iZHNkaWdpdGFsLmNvbS5hci9hdXRoL3JlYWxtcy9iZHMtaW50IiwiYXVkIjoiaHR0cDovL2tleWNsb2FrLWludC5iZHNkaWdpdGFsLmNvbS5hci9hdXRoL3JlYWxtcy9iZHMtaW50Iiwic3ViIjoiMGVkYzM1OTctMTFmMi00NGIxLWE2MmYtYmUzOGVhZGUwNjU3IiwidHlwIjoibGluay1hY2NvdW50LWFjdGlvbi10b2tlbiIsIm5vbmNlIjoiYTRmZTc4NTctYzkwYy00YWI5LWI4YTQtODQ4OGUzNTExNWQzIiwiZGV2aWNlX2lkIjoiYTZkNjkxMDVmN2Y0YjEwZCIsInVzZXJfaWQiOiIwZWRjMzU5Ny0xMWYyLTQ0YjEtYTYyZi1iZTM4ZWFkZTA2NTciLCJwZXJzb25faWQiOiIxNiIsImFzaWQiOm51bGx9.gc5suwhtmTKfGUNlsICjfwUG5nAstAX0JKMkw9I0dTv6Ae-vEi7RnaEZ-0XfZDeE8l2ZfrIzA-9NazQg3SZjbefFik57b9wgBbuA-wwf7a2RR73AqvwJu-TaA2Su-ufVYfscqs5qzP-QVZchaY_FWcozWsR5nTXVD5g_GclfD7pmER1OZVWQQzcbVVm-B7CYBfeMxwC8PKovfIQB9dN5yM8hNbRM6sAJQCpI2B-0ex_6xMfj_WfUNYcGWvoS1yTnwJcf1QwNIV2SusjNe8W2sGzAO5z7PpIw-nGOC5dJ7WGjM3NA9cg9Ncl-eY55kfMr5wyfIrOASHpY2kmQTHGKEQ'
    * def idSimulacion = '6112d5092c928d0f5f044579'

Scenario:  BDSD-15659 - Realizar una consulta del resultado de una simulación existente a T24
    Given path 'simulations', idSimulacion
    And header Authorization = 'Bearer ' + token
    And method get
    Then status 200

Scenario:  BDSD-15660 - Realizar una consulta del resultado de una simulación inexistente a T24
    Given path 'simulations', 'AASIMR21124TLCFZF0'
    And header Authorization = 'Bearer ' + token
    And method get
    Then status 404