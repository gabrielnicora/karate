Feature: Realizar una transferencia Interna BDS

  Background:
    * url bdsUrl
    * def dataUsuariobds = usuariobds

  Scenario: BDSD-17228 - Generamos la autorizacion y luego la transferencia interna de BDS Haberes
    ##Recuperamos el RefNo
    Given path 'verFundsTransfer_BdsTranInters()/new'
    And header Authorization = dataUsuariobds
    And header Content-Type = 'application/json'
    When method post
    Then status 201
    * string respect = response
    * def start = respect.indexOf('RefNo')
    * def RefNo = respect.substring(start + 6)
    * def end = RefNo.indexOf('</d:RefNo>')
    * def RefNo = RefNo.substring(0, end)
    * def RefNoUrl = '(' + RefNo + ')'

  ##Usamos el Refno para generar la transferencia
  Given path 'verFundsTransfer_BdsTranInters'+ RefNoUrl
    * def body =
    """
   {
   "AuditDateTime": "",
    "AuditorCode": "",
    "Authoriser": "",
    "BcBankSortCode": "",
    "BenAcctNo": "",
    "BenCustomerMvGroup": [
      {
        "valuePosition": "1",
        "subValuePosition": "1",
        "BenCustomer": ""
      }
    ],
    "BenOurCharges": "",
    "BeneficiaryId": "",
    "BicIbanBen": "",
    "BicIbanBenCity": "",
    "BicIbanBenNameMvGroup": [
      {
        "valuePosition": "1",
        "subValuePosition": "1",
        "BicIbanBenName": ""
      }
    ],
    "CoCode": "",
    "CreditAcctNo": "1000004182",
    "CreditAmount": "",
    "CreditCurrency": "",
    "CreditTheirRef": "",
    "CurrNo": "",
    "CustomerRate": "",
    "DateTimeMvGroup": [
      {
        "valuePosition": "1",
        "subValuePosition": "1",
        "DateTime": ""
      }
    ],
    "DebitAcctNo": "1200000141",
    "DebitAmount": "400",
    "DebitCurrency": "ARS",
    "DebitTheirRef": "",
    "DeptCode": "",
    "IbanBen": "",
    "Id": "",
    "InputterMvGroup": [
      {
        "valuePosition": "1",
        "subValuePosition": "1",
        "Inputter": ""
      }
    ],
    "LCuit": "",
    "LDescConcep": "",
    "LIdConcepto": "HAB",
    "LNomDest": "",
    "LNombreOrig": "",
    "LNroDocOrig": "",
    "LSaldoDisp": "",
    "OverrideMvGroup": [
      {
        "valuePosition": "1",
        "subValuePosition": "1",
        "Override": ""
      }
    ],
    "PaymentDetailsMvGroup": [
      {
        "valuePosition": "1",
        "subValuePosition": "1",
        "PaymentDetails": ""
      }
    ],
    "ProcessingDate": "",
    "RecordStatus": "",
    "RefNo": '#(RefNo)',
    "TransactionType": "ACIN"
    }
    """
    And header Authorization = dataUsuariobds
    And request body
    When method post
    Then status 201
