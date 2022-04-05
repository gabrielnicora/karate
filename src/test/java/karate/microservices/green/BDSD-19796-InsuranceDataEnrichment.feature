@regression_green @insurance-data-enrichment
Feature: ABM de enriquecimiento de coberturas y razones de baja

    Background:
        * url insuranceBaseUrl
        * def now = function(){ return java.lang.System.currentTimeMillis() }
        * def reasonIdInexistente = insuranceEditCancelationReasonInexistente
        * def reasonIdEdit = insuranceEditCancelationReason
        * def reasonId2 = insuranceSecondCancelationReason
        When path '/v1/reasons'
        And method get
        * def reasonId = response[0]._id

    Scenario:  BDSD-20270 - Se crea una nueva razón de baja - Se obtienen todas las razones de baja
        When path '/v1/reasons'
        * def name = 'Test-' + now()
        And method get
        * print response
        * def reasonSize = response.length
        When path '/v1/reasons'
        And request
            """
            {
                "value": "#(name)"
            }
            """
        And method post
        Then match response._id == '#string'
        And match response.value == name
        And match response.__v == '#present'
        * def id = response._id
        When path '/v1/reasons'
        And method get
        * print response
        * def newReasonSize = response.length
        * assert newReasonSize > reasonSize
        When path '/v1/reasons/' + id
        And method delete

    Scenario:  BDSD-20271 - Se intenta crear una nueva razon de baja pero no se envía el campo value obteniendo error 400
        When path '/v1/reasons'
        And request
            """
            {}
            """
        And method post
        Then match response.statusCode == 400

    Scenario:  BDSD-20272 - Se edita una razón de baja y se valida el nuevo valor consultado x reasonID
        When path '/v1/reasons/' + reasonIdEdit
        * def texto = 'Texto editado-' + now()
        And request
            """
            {
                "value": "#(texto)"
            }
            """
        And method patch
        Then status 204
        When path '/v1/reasons/' + reasonIdEdit
        And method get
        Then match response.value == texto

    # BUG: https://gss-bdsol.atlassian.net/browse/BDSD-19786
    
    Scenario:  BDSD-20273 - Se edita una razón de baja pero no se envía el campo value
        When path '/v1/reasons/' + reasonId
        * def texto = 'Texto editado-' + now()
        And request
            """
            {

            }
            """
        And method patch
        Then status 400

    
    Scenario: BDSD-20274 Se crea un nuevo producto sin enviar ningun plan
        When path '/v1/products'
        * def branchCodeRandom = Math.floor(Math.random() * (99999 - 10000)) + 1;
        * def productCodeRandom = Math.floor(Math.random() * (99999 - 1000)) + 1;
        And method get
        * print response
        * def productsSize = response.length
        When path '/v1/products'
        And request
        """
            {
         "summary": [
                    "test 1", "test 2"
                    ],
    "branchCode": "#(branchCodeRandom)",
    "productCode": #(productCodeRandom),
    "branchName": "Test - KARATE",
    "productName": "Automation product - Karate",
    "plans": [],
    "cancellationReasons": []
}
         """
        And method post
        And status 201
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom
        And method get
        * assert 0 == response.plans.length

        
    Scenario: BDSD-20275 Se crea un nuevo producto sin enviar el motivo de baja
        When path '/v1/products'
        * def branchCodeRandom = Math.floor(Math.random() * (99999 - 10000)) + 1;
        * def productCodeRandom = Math.floor(Math.random() * (99999 - 1000)) + 1;
        And method get
        * print response
        * def productsSize = response.length
        When path '/v1/products'
        And request
        """
            {
         "summary": [
                    "test 1", "test 2"
                    ],
    "branchCode": "#(branchCodeRandom)",
    "productCode": #(productCodeRandom),
    "branchName": "Test - KARATE",
    "productName": "Automation product - Karate",
    "plans": [
        {
            "id": "9",
            "name": "Test Postman Plan name 1 Gaby",
            "covers": [
                {
                    "coverCode": "9",
                    "description": "descripcion",
                    "detail": "detalle bds",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000

                },
                {
                    "coverCode": "10",
                    "description": "descripcion 10",
                    "detail": "detalle bds 10",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000
                }
            ]
        }
    ],
    "cancellationReasons": []
}
         """
        And method post
        And status 201
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom
        And method get
        * assert 0 == response.cancellationReasons.length

    Scenario:  BDSD-20276 - Se crea un nuevo producto enviando motivo de baja inexistente
        When path '/v1/products'
        * def branchCodeRandom = Math.floor(Math.random() * (99999 - 10000)) + 1;
        * def productCodeRandom = Math.floor(Math.random() * (99999 - 1000)) + 1;
        And method get
        * print response
        * def productsSize = response.length
        When path '/v1/products'
        And request
        """
            {
         "summary": [
                    "test 1", "test 2"
                    ],
    "branchCode": "#(branchCodeRandom)",
    "productCode": #(productCodeRandom),
    "branchName": "Test - KARATE",
    "productName": "Automation product - Karate",
    "plans": [
        {
            "id": "9",
            "name": "Test Postman Plan name 1 Gaby",
            "covers": [
                {
                    "coverCode": "9",
                    "description": "descripcion",
                    "detail": "detalle bds",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000

                },
                {
                    "coverCode": "10",
                    "description": "descripcion 10",
                    "detail": "detalle bds 10",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000
                }
            ]
        }
    ],
    "cancellationReasons": [{ "_id": "#(reasonIdInexistente)" }]
}
         """
        And method post
        And status 500

    Scenario:  BDSD-20276 - Se crea un nuevo producto enviando motivo de baja
        When path '/v1/products'
        * def branchCodeRandom = Math.floor(Math.random() * (99999 - 10000)) + 1;
        * def productCodeRandom = Math.floor(Math.random() * (99999 - 1000)) + 1;
        And method get
        * print response
        * def productsSize = response.length
        When path '/v1/products'
        And request
        """
            {
         "summary": [
                    "test 1", "test 2"
                    ],
    "branchCode": "#(branchCodeRandom)",
    "productCode": #(productCodeRandom),
    "branchName": "Test - KARATE",
    "productName": "Automation product - Karate",
    "plans": [
        {
            "id": "9",
            "name": "Test Postman Plan name 1 Gaby",
            "covers": [
                {
                    "coverCode": "9",
                    "description": "descripcion",
                    "detail": "detalle bds",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000

                },
                {
                    "coverCode": "10",
                    "description": "descripcion 10",
                    "detail": "detalle bds 10",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000
                }
            ]
        }
    ],
    "cancellationReasons": [{ "_id": "#(reasonId)" }]
}
         """
        And method post
        * def productId = response._id
        Then match response._id == '#string'
        And match response.branchCode == branchCodeRandom
        And match response.productCode == productCodeRandom
        And match response.branchName == 'Test - KARATE'
        And match response.productName == 'Automation product - Karate'
        And match response.__v == '#present'
        And match response.plans[0].covers == '#array'
        And match response.cancellationReasons == '#array'
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom
        And method get
        * assert reasonId == response.cancellationReasons[0]

    Scenario:  BDSD-20277 - Se crea y elimina un producto
        When path '/v1/products'
        * def branchCodeRandom = Math.floor(Math.random() * (99999 - 10000)) + 1;
        * def productCodeRandom = Math.floor(Math.random() * (99999 - 1000)) + 1;
        And method get
        * print response
        * def productsSize = response.length
        When path '/v1/products'
        And request
        """
            {
 "summary": [
        "test 1", "test 2"
    ],
    "branchCode": "#(branchCodeRandom)",
    "productCode": #(productCodeRandom),
    "branchName": "Test - KARATE",
    "productName": "Automation product - Karate",
    "plans": [
        {
            "id": "9",
            "name": "Test Postman Plan name 1 Gaby",
            "covers": [
                {
                    "coverCode": "9",
                    "description": "descripcion",
                    "detail": "detalle bds",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000

                },
                {
                    "coverCode": "10",
                    "description": "descripcion 10",
                    "detail": "detalle bds 10",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000
                }
            ]
        }
    ],
    "cancellationReasons": []
}
         """
        And method post
        * def productId = response._id
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom
        And method get
        When path '/v1/products/'+ branchCodeRandom + '-' + productCodeRandom
        And method delete
        Then status 204
        When method get
        Then status 404


    Scenario:  BDSD-20278 - Se intenta eliminar un producto enviando un ID inexistente obteniendo error 404
        When path '/v1/products/9999999999-999999999999999'
        And method delete
        Then status 404
        * assert '/v1/products/9999999999-999999999999999' == response.path

    
    Scenario:  BDSD-20279 - Se agrega producto con 1 motivo de baja y luego se asocia segundo motivo de baja.
        When path '/v1/products'
        * def branchCodeRandom = Math.floor(Math.random() * (99999 - 10000)) + 1;
        * def productCodeRandom = Math.floor(Math.random() * (99999 - 1000)) + 1;
        And method get
        * print response
        * def productsSize = response.length
        When path '/v1/products'
        And request
        """
            {
 "summary": [
        "test 1", "test 2"
    ],
    "branchCode": "#(branchCodeRandom)",
    "productCode": #(productCodeRandom),
    "branchName": "Test - KARATE",
    "productName": "Automation product - Karate",
    "plans": [
        {
            "id": "9",
            "name": "Test Postman Plan name 1 Gaby",
            "covers": [
                {
                    "coverCode": "9",
                    "description": "descripcion",
                    "detail": "detalle bds",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000

                },
                {
                    "coverCode": "10",
                    "description": "descripcion 10",
                    "detail": "detalle bds 10",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000
                }
            ]
        }
    ],
    "cancellationReasons": [{ "_id": "6217c749374d46b195a7aa7c" }]
}
         """
        And method post
        * def productId = response._id
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom
        And method get
        * def cancellationReasonsSize = response.cancellationReasons.length
        When path '/v1/reasons'
        * def name = 'test-' + now()
        And request
            """
            {
                "value": "#(name)"
            }
            """
        And method post
        * def reasonsId = response._id
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom + '/reasons'
        And request
            """
            {
                "id": "#(reasonsId)"
            }
            """
        And method post
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom
        And method get
        * assert '6217c749374d46b195a7aa7c' == response.cancellationReasons[0]
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom + '/reasons'
        And request
            """
            [
                {
                "_id": "6213aef895b319dbf3bd4cc0"
                }
            ]
            """
        And method post
        Then status 201
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom
        And method get
        * print response
        * assert '6213aef895b319dbf3bd4cc0' == response.cancellationReasons[1]



    Scenario:  BDSD-20280 - Se elimina un motivo de baja a un producto con 1 solo motivo asociado
        When path '/v1/products'
        * def branchCodeRandom = Math.floor(Math.random() * (99999 - 10000)) + 1;
        * def productCodeRandom = Math.floor(Math.random() * (99999 - 1000)) + 1;
        And method get
        * print response
        * def productsSize = response.length
        When path '/v1/products'
        And request
        """
            {
 "summary": [
        "test 1", "test 2"
    ],
    "branchCode": "#(branchCodeRandom)",
    "productCode": #(productCodeRandom),
    "branchName": "Test - KARATE",
    "productName": "Automation product - Karate",
    "plans": [
        {
            "id": "9",
            "name": "Test Postman Plan name 1 Gaby",
            "covers": [
                {
                    "coverCode": "9",
                    "description": "descripcion",
                    "detail": "detalle bds",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000

                },
                {
                    "coverCode": "10",
                    "description": "descripcion 10",
                    "detail": "detalle bds 10",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000
                }
            ]
        }
    ],
    "cancellationReasons": [{ "_id": "#(reasonId)" }]
}
         """
        And method post
        * def productId = response._id
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom
        And method get
        * def cancellationReasonsSize = response.cancellationReasons.length
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom
        And method get
        * assert reasonId == response.cancellationReasons[0]
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom + '/reasons/' + reasonId
        And request 
        """
            {
              "_id": "#(reasonId)"
            }
        """
        And method delete
        Then status 200
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom
        And method get
        * assert cancellationReasonsSize > response.cancellationReasons.length

    Scenario:  BDSD-20281 - Se elimina un motivo de baja a un producto con 2 motivo de baja asociados
        When path '/v1/products'
        * def branchCodeRandom = Math.floor(Math.random() * (99999 - 10000)) + 1;
        * def productCodeRandom = Math.floor(Math.random() * (99999 - 1000)) + 1;
        And method get
        * print response
        * def productsSize = response.length
        When path '/v1/products'
        And request
        """
            {
 "summary": [
        "test 1", "test 2"
    ],
    "branchCode": "#(branchCodeRandom)",
    "productCode": #(productCodeRandom),
    "branchName": "Test - KARATE",
    "productName": "Automation product - Karate",
    "plans": [
        {
            "id": "9",
            "name": "Test Postman Plan name 1 Gaby",
            "covers": [
                {
                    "coverCode": "9",
                    "description": "descripcion",
                    "detail": "detalle bds",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000

                },
                {
                    "coverCode": "10",
                    "description": "descripcion 10",
                    "detail": "detalle bds 10",
                    "claimService": false,
                    "featured": true,
                    "amount": 122000
                }
            ]
        }
    ],
    "cancellationReasons": [{ "_id": "#(reasonId)" }]
}
         """
        And method post
        * def productId = response._id
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom
        And method get
        * def cancellationReasonsSize = response.cancellationReasons.length
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom + '/reasons'
        And request
            """
            [{
                "_id": "#(reasonId2)"
            }]
            """
        And method post
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom
        And method get
        * print response
        * assert reasonId2 == response.cancellationReasons[1]
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom + '/reasons/' + response.cancellationReasons[0]
        And request 
        """
            {
              "_id": "#(response.cancellationReasons[0])"
            }
        """
        And method delete
        Then status 200
        When path '/v1/products/' + branchCodeRandom + '-' + productCodeRandom
        And method get
        * assert response.cancellationReasons.length == 1