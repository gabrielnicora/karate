Feature: Realizar una transferencia interbanking

  Background:
    * url interbankingUrl
    * def dataUsuariot24 = usuariot24
  Scenario: BDSD-17226 - Generamos la autorizacion y luego la transferencia de Interbanking Haberes
    ##Recuperamos el RefNo
    Given path 'verFundsTransfer_BdsDnetlegacyInps()/new'
    And header Authorization = dataUsuariot24
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
  Given path 'verFundsTransfer_BdsDnetlegacyInps'+ RefNoUrl
    * def legacyData = randomLegacy
    * def body =
    """
   {
    "AuditDateTime": "",
    "AuditorCode": "",
    "Authoriser": "",
    "CoCode": "",
    "CreditAcctNo": "1200000044",
    "CreditAmount": "99.44",
    "CreditCurrency": "ARS",
    "CurrNo": "",
    "DateTimeMvGroup": [
      {
        "valuePosition": "1",
        "subValuePosition": "1",
        "DateTime": ""
      }
    ],
    "DebitAcctNo": "ARS100040001",
    "DeptCode": "",
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
    "LFechaTrx": "20210929",
    "LHoraLocal": "113153",
    "LIdConcepto": "HAB",
    "LIdlegacy": '#(legacyData)',
    "LMismaTit": "NO",
    "LNomDest": "Prueba",
    "LNroDocOrig": "27198512104",
    "LTipoDocOrig": "",
    "LTipoMensaje": "07",
    "OrderingBankMvGroup": [
      {
        "valuePosition": "1",
        "subValuePosition": "1",
        "OrderingBank": "BDS"
      }
    ],
    "OverrideMvGroup": [
      {
        "valuePosition": "1",
        "subValuePosition": "1",
        "Override": ""
      }
    ],
    "RecordStatus": "",
    "RefNo": '#(RefNo)',
    "TransactionType": "ACW3"

}
"""
    And header Authorization = dataUsuariot24
    And request body
    When method post
    Then status 201
