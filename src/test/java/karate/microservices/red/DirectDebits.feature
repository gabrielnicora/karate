@direct-debits
Feature: Se realiza el alta, verificación y borrado de un cliente en la Whitelist

  Background:
    * url directdebitsUrl

  Scenario: BDSD-17574 - Se Chequean accesos a la whitelis
    Given path 'direct-debits/v1/policies/white-list'
    And header Content-Type = 'application/json'
    * def body =
    """
   {
   "cuit": "20438543911",
    "pw": "whitelist_pw"
    }
    """
    And request body
    When method POST
    Then status 200

    * url signBaseUrl
    Given path 'v1/link-account-token'
    And header Content-Type = 'application/json'
    And header bds-device = '12345'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request
    """
{
  "deviceId": "12345",
  "email": "bdsolqel8b1de01@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url directdebitsUrl
    And path 'direct-debits/v1/policies/white-list'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    When method GET
    Then status 200
    And match response.authorized == true

    And path 'direct-debits/v1/policies/white-list'
    And header Content-Type = 'application/json'
    * def body =
    """
   {
   "cuit": "20438543911",
    "pw": "whitelist_pw"
    }
    """
    And request body
    When method DELETE
    Then status 200

      * url signBaseUrl
    Given path 'v1/link-account-token'
    And header Content-Type = 'application/json'
    And header bds-device = '12345'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request
    """
{
  "deviceId": "12345",
  "email": "bdsolqel8b1de01@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url directdebitsUrl
    And path 'direct-debits/v1/policies/white-list'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    When method GET
    Then status 200
    And match response.authorized == false


  Scenario: BDSD-17858 - Adhesion de polizas Sancor sin token
    Given path 'direct-debits/v1/policies/'
    And header Content-Type = 'application/json'
    * def body =
  """
  {
  "ids": ["200-7062695","200-6995830", "200-3870350"],
  "cbu": "3108100900012000001419"
  }
  """
    And request body
    When method POST
    Then status 400

  Scenario: BDSD-17858 - Adhesion de polizas Sancor con Token mal formado
    Given path 'direct-debits/v1/policies/'
    And header Content-Type = 'application/json'
    And header Authorization = 'XXX'
    * def body =
  """
  {
  "ids": ["200-7062695","200-6995830", "200-3870350"],
  "cbu": "3108100900012000001419"
  }
  """
    And request body
    When method POST
    Then status 404


  Scenario: BDSD-17858 - Adhesion de polizas Sancor con Token erroneo
    Given path 'direct-debits/v1/policies/'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IklkOExYaXc5ck5CVElqUlAzcXFtbXNqZzI2d1lJMzZOckc0bERBenRsNDgifQ.eyJleHAiOjE2NDQ5OTU5NzgsImlhdCI6MTY0NDk5NTkxOCwianRpIjoiNzk2NzZhZTYtNDY2NS00NGU3LWFkMmEtZTcwZTgzNzVkMTZkIiwiaXNzIjoiaHR0cDovL2tleWNsb2FrLXVhdC5iZHNkaWdpdGFsLmNvbS5hci9hdXRoL3JlYWxtcy9iZHMtdWF0IiwiYXVkIjoiYWNjb3VudCIsInN1YiI6IjU1MTVmOGZmLTZmYjgtNGI5My1hMmZlLWYzZDk5OGRhM2NmNiIsInR5cCI6IkJlYXJlciIsImF6cCI6ImNsaWVudHMtYXV0aC1zaWdudXAiLCJzZXNzaW9uX3N0YXRlIjoiOGRjZDFlOTItY2QxOS00NzJkLTg0M2YtMGU2ZWQ3OWM4ZTAyIiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiIiLCJwZXJzb25faWQiOiIwIn0.XIxJNcTabRHeYfsrjAKyiIvHPQbzRZPmvko11v9_x7DSaeWJn6TwqbXnHFjYpzp80k05x9SfMr8wFbO9ytRYt5TUXIG9NGpzT2O81pJ0iOijAMn_l1WpVqkn0eiB6vo_Mq_fSha_7LA8zeocJ1uHXfERskqPk5tlx0hpLY4aAnyBFFt4UUuHgLPakRd7odpWvxxeQPfwY155_ShdH19oaYmGN-J7li8I2G5z89dTmMkvNuCaoFgCm5uvpKc5t9JY1OuYndxWWi_-JtGEqMWzOriC8OEUOru6wNFFYw3q9UTP8qLdIvGhRqXjxMGFJjZjXbAKGNclrwIOB7d7sIiJ1A'
    * def body =
  """
  {
  "ids": ["200-7062695","200-6995830", "200-3870350"],
  "cbu": "3108100900012000001419"
  }
  """
    And request body
    When method POST
    Then status 404

  Scenario: BDSD-17858 - Consulta de polizas Sancor con Token Erroneo
    Given path 'direct-debits/v1/policies'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IklkOExYaXc5ck5CVElqUlAzcXFtbXNqZzI2d1lJMzZOckc0bERBenRsNDgifQ.eyJleHAiOjE2NDQ5OTU5NzgsImlhdCI6MTY0NDk5NTkxOCwianRpIjoiNzk2NzZhZTYtNDY2NS00NGU3LWFkMmEtZTcwZTgzNzVkMTZkIiwiaXNzIjoiaHR0cDovL2tleWNsb2FrLXVhdC5iZHNkaWdpdGFsLmNvbS5hci9hdXRoL3JlYWxtcy9iZHMtdWF0IiwiYXVkIjoiYWNjb3VudCIsInN1YiI6IjU1MTVmOGZmLTZmYjgtNGI5My1hMmZlLWYzZDk5OGRhM2NmNiIsInR5cCI6IkJlYXJlciIsImF6cCI6ImNsaWVudHMtYXV0aC1zaWdudXAiLCJzZXNzaW9uX3N0YXRlIjoiOGRjZDFlOTItY2QxOS00NzJkLTg0M2YtMGU2ZWQ3OWM4ZTAyIiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsInVtYV9hdXRob3JpemF0aW9uIl19LCJyZXNvdXJjZV9hY2Nlc3MiOnsiYWNjb3VudCI6eyJyb2xlcyI6WyJtYW5hZ2UtYWNjb3VudCIsIm1hbmFnZS1hY2NvdW50LWxpbmtzIiwidmlldy1wcm9maWxlIl19fSwic2NvcGUiOiIiLCJwZXJzb25faWQiOiIwIn0.XIxJNcTabRHeYfsrjAKyiIvHPQbzRZPmvko11v9_x7DSaeWJn6TwqbXnHFjYpzp80k05x9SfMr8wFbO9ytRYt5TUXIG9NGpzT2O81pJ0iOijAMn_l1WpVqkn0eiB6vo_Mq_fSha_7LA8zeocJ1uHXfERskqPk5tlx0hpLY4aAnyBFFt4UUuHgLPakRd7odpWvxxeQPfwY155_ShdH19oaYmGN-J7li8I2G5z89dTmMkvNuCaoFgCm5uvpKc5t9JY1OuYndxWWi_-JtGEqMWzOriC8OEUOru6wNFFYw3q9UTP8qLdIvGhRqXjxMGFJjZjXbAKGNclrwIOB7d7sIiJ1A'
    When method GET
    Then status 404

  Scenario: BDSD-17858 - Consulta de polizas Sancor con Token null
    Given path 'direct-debits/v1/policies'
    And header Content-Type = 'application/json'
    And header Authorization = ''
    When method GET
    Then status 404

  Scenario: BDSD-17858 - Consulta y Adhesion de polizas Sancor con Token Ok
    * url signBaseUrl
   Given path 'v1/link-account-token'
    And header Content-Type = 'application/json'
    And header bds-device = '12345'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request
    """
{
  "deviceId": "12345",
  "email": "bdsolqel8b1de01@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url directdebitsUrl
    And path 'direct-debits/v1/policies'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    When method GET
    Then status 200
    And path 'direct-debits/v1/policies/'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
  {
  "ids": ["200-7062695","200-6995830", "200-3870350"],
  "cbu": "3108100900012000001419"
  }
  """
    And request body
    When method POST
    Then status 200


  Scenario: BDSD-17858 - Caso Erroneo de adhesion con Token Ok
    * url signBaseUrl
    Given path 'v1/link-account-token'
    And header Content-Type = 'application/json'
    And header bds-device = '12345'
    And header bds-ip = '10.224.0.229'
    And header bds-device-model = 'model'
    And header bds-device-os = 'android'
    And request
    """
{
  "deviceId": "12345",
  "email": "bdsolqelb8c84aa@gmail.com",
  "appBundleId": "ar.com.bdsol.bds.squads.int"
}
    """
    When method post
    Then status 200
    * def accessToken = response.actionToken
    * url directdebitsUrl
    And path 'direct-debits/v1/policies'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    When method GET
    Then status 200
    And path 'direct-debits/v1/policies/'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + accessToken
    * def body =
  """
  {
  "ids": ["200-7062695","200-6995830", "200-3870350"],
  "cbu": "3108100900012000001419"
  }
  """
    And request body
    When method POST
    Then status 400