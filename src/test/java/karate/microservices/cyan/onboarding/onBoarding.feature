@int @regression @regression_cyan
Feature: onBoarding complete

  Background:
    * url peopleHubBaseUrl
    * def pathSign = 'onboarding/v1/signup-requests'
    * def dniData = randomCuil.dni
    * def cuilData = randomCuil.cuil
    * def nameData = randomName
    * def lastnameData = randomLastName
    * def deviceId = randomDevice
    * def emailData = randomEmail
    * def passcode = randomPasscode

    * def sleep =
      """
      function(seconds){
        for(i = 0; i <= seconds; i++)
        {
          java.lang.Thread.sleep(1*1000);
          karate.log(i);
        }
      }
      """

  Scenario: Realiza onBoarding
    Given path 'persons'
    And param dni = dniData
    When method get
    Then status 200
    * path 'sign-up-requests'
    * def bodyCreateSignUp =
    """
    {
          "email": '#(emailData)',
          "deviceId": '#(deviceId)',
          "appBundleId": '#(appBundleId)'
    }
    """
    And request bodyCreateSignUp
    When method post
    Then status 201
    And def personId = response.id
    * path pathSign, personId
    * def pathImages =
    """
    {
      "faceUrl":"https://firebasestorage.googleapis.com/v0/b/bds-7de15.appspot.com/o/development%2Fonboarding%2Fimages%2Ffaces%2F74?alt=media&token=036e7537-4fa2-415c-b56a-c16c8c84062f",
      "idFrontUrl":"https://firebasestorage.googleapis.com/v0/b/bds-7de15.appspot.com/o/development%2Fonboarding%2Fimages%2Fids%2Ffront%2F74?alt=media&token=5b9d7c0c-7340-4c8e-8fc1-0368916f62ef",
      "idBackUrl":"https://firebasestorage.googleapis.com/v0/b/bds-7de15.appspot.com/o/development%2Fonboarding%2Fimages%2Fids%2Fback%2F74?alt=media&token=83665b6f-e62b-4423-9d3b-16a7ccbe1c80"
	}
    """
    And request pathImages
    When method patch
    Then status 200
    * path pathSign, personId, 'validate-biometry-manually'
    * def bodyValidateCustomerVeracityManually =
    """
    {
        "idNumber": "05723877",
        "gender": "F",
        "order": "00200428841",
        "nationality": "ARG"
    }
    """
    And request bodyValidateCustomerVeracityManually
    When method post
    Then status 201
    * path 'persons', personId
    When method get
    Then status 200
    * path 'persons', personId
    When method get
    Then status 200
    * path pathSign, personId
    * def bodyModifyPersonContactInfo =
    """
     {
        "renaperVerifyPhoto":{
        "identical": true,
        "confidence": "90.0"}
     }
    """
    And request bodyModifyPersonContactInfo
    When method patch
    Then status 200
    * path pathSign, personId
    * def bodyModifyRenaperCustomerDocumentData =
    """
    {"renaperCustomerDocumentData": {
                "code": "10001",
                "message": "Exito",
                "person": {
                "number": '#(dniData)',
                "names": '#(nameData)',
                "lastNames": '#(lastnameData)',
                "gender": "M",
                "birthdate": "29/12/1983",
                "copy": "A",
                "expirationDate": "29/01/2030",
                "creationDate": "29/01/2015",
                "cuil": '#(cuilData)',
                "streetAddress": "AV. SANTA FE",
                "numberStreet": "1881",
                "floor": "4",
                "department": "A",
                "zipCode": "1123",
                "city": "RECOLETA",
                "municipality": "CIUDAD DE BUENOS AIRES",
                "province": "CIUDAD DE BUENOS AIRES",
                "country": "ARGENTINA",
                "nationality": "ARGENTINA",
                "countryBirth": "ARGENTINA",
                "messageOfDeath": "Sin Aviso de Fallecimiento"
            },
            "valid": "Vigente",
            "standardName": '#(nameData)',
            "standardLastName": '#(lastnameData)'
        }}
    """
    And request bodyModifyRenaperCustomerDocumentData
    When method patch
    Then status 200
    * path pathSign, personId
    * def ModifyFacephiCustomerDocumentData =
    """
    {"facephiCustomerDocumentData": {
            "gender": "M",
            "documentNumber": '#(dniData)',
            "firstName": '#(nameData)',
            "lastName": '#(lastnameData)',
            "dateOfBirth": "29/12/1983",
            "dateOfExpiry": "29/01/2030",
            "dateOfIssue": "29/01/2015",
            "front": {
                "mrz": {
                    "nationality": "ARG"
                },
                "pdf417": {
                    "nroTramite": "00338405708",
                    "example": "A"
                }
            }
        }}
    """
    And request ModifyFacephiCustomerDocumentData
    When method patch
    Then status 200
    * path 'persons', personId
    When method get
    Then status 200
    * path 'risk','v1', personId
    When method get
    Then status 200
    * def bodyAcceptTyc = { "termsAccepted": { "termsVersion": "5f5aaa5e7556ae002e98c506" } }
    * path pathSign, personId
    And request bodyAcceptTyc
    When method patch
    Then status 200
    * def bodyPatchCompleted = { "onboardingState":"COMPLETED" }
    * path pathSign, personId
    And request bodyPatchCompleted
    When method patch
    Then status 200
    * path pathSign, personId, 'create-customer'
    And request { }
    When method post
    Then status 201
    And def token = $.actionToken
    * def bodyCreatePasscode = { "passcode": '#(passcode)', "actionToken": '#(token)', "device": { "uid": '#(deviceId)', "model": "model", "name": "name", "ipAddress": "ipAddress" } }
    * url 'http://auth-int.bdsdigital.com.ar/auth/v1/create-passcode'
    And request bodyCreatePasscode
    When method post
    Then status 200
    And def offlineToken = $.offlineToken
    * url 'https://customers-int.bdsdigital.com.ar/restrictions'
    And param idPerson = personId
    When method get
    Then status 200
    * callonce sleep 40
#    * url 'https://customers-int.bdsdigital.com.ar/restrictions'
#    * def bodyRestriction =
#    """
#    {
#      "flowType": "VERIFY_CUSTOMER",
#      "idOrchestrator": "0",
#      "idPerson": personId,
#      "informedBy": "ONBOARDING",
#      "restrictionType": "UIF",
#      "status": "UNLOCK"
#    }
#    """
#    And request bodyRestriction
#    When method post
#    Then status 200
    * url 'http://auth-int.bdsdigital.com.ar/auth/v1/sign-in'
    * def bodySignIn =
    """
    {
        "offlineToken": '#(offlineToken)',
        "passcode": '#(passcode)',
        "email": '#(emailData)',
        "deviceId": '#(deviceId)'
    }
    """
    And request bodySignIn
    When method post
    Then status 200
    And def refresh = response.refreshToken
    * url 'http://auth-int.bdsdigital.com.ar/auth/v1/sign-out'
    * def bodySignOut =
    """
    {
      "refreshToken": '#(refresh)'
    }
    """
    And request bodySignOut
    When method post
    Then status 204


